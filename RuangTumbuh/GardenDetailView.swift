//
//  GardenDetailView.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 27/11/21.
//

import SwiftUI

struct GardenDetailView: View {
    
    @EnvironmentObject var appdata : AppData
    
    @StateObject var garden : UserDefaultService = UserDefaultService.shared
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("myGray"))
                    .ignoresSafeArea()
                ScrollView{
                    
                    VStack{
                        if garden.currentGarden.listTools.filter{$0.checklist}.count == garden.currentGarden.listTools.count && !garden.currentGarden.listTools.isEmpty{
                            GardenJournalView()
                        }
                        
                        if !UserDefaultService.shared.currentGarden.listTools.isEmpty{
                            PlanCardView(garden:garden){
                                let view = PlanChecklistView(garden:garden)
                                    .environmentObject(appdata)
                                let vc = UIHostingController(rootView: view)
                                appdata.navigation?.show(vc, sender: nil)
                            }
                        }
                        StepPrepareView( garden: garden)
                            .background(Color.white)
                        if !garden.currentGarden.sizeArea.isZero && !garden.currentGarden.candleLight.isZero{
                            ReferenceView(title: "Rekomendasi Untukmu", images:  ["Bok-Choy","Romaine Lettuce","Green Lettuce"])
                                .background(Color.white)
                        }
                    }
                }
            }.onAppear(perform: {
                appdata.navigation?.navigationBar.isHidden = true
            })
            
                .background(Color("myGray"))
                .navigationBarTitle(UserDefaultService.shared.currentGarden.name, displayMode: .large)
                .navigationBarBackButtonHidden(false)
                .navigationBarItems(leading:
                                        Button(action: {
                    appdata.navigation?.popToRootViewController(animated: true)
                }, label: {
                    HStack{
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("myYellow"))
                        Text("Ayo Bertanam")
                            .foregroundColor(Color("myYellow"))
                    }
                })
                )
            
            
        }.background(Color("myGray")).navigationViewStyle(StackNavigationViewStyle())
    }
}

struct StepPrepareView:View{
    
    @EnvironmentObject var appdata : AppData
    @ObservedObject var garden : UserDefaultService
    
    var body: some View{
        VStack{
            HStack{
                Text("Langkah Persiapan")
                    .foregroundColor(Color("myGreen"))
                    .font(.system(size: 22))
                    .bold()
                Spacer()
            }.padding(.horizontal).padding(.top)

            locationView
                .onTapGesture {
                    let view = TutorialPageView(title: "Pengukuran Lokasi",width:300,tutorial: "Ayuk kita ukur lokasi yang tersedia",desc: "Mari kita ukur lokasi tempat calon kebunmu, dengan begitu kamu akan dapat rekomendasi yang lebih baik!", garden: garden)
                        .environmentObject(appdata)
                        
                    
                    let vc = UIHostingController(rootView: view)
                    
                    appdata.navigation?.show(vc, sender: nil)
                }
            Divider()
            lighting
                .onTapGesture {
                    let view = TutorialPageView(title: "Pengukuran Cahaya",width:200,tutorial: "Yuk Cek Cahaya di Kebunmu",desc: "Untuk memeriksa cahaya di lokasi kamu, pastikan cuaca sedang terik (siang hari). pengukuran ini membantumu memilih tanaman yang tepat untuk kebunmu.", garden: garden)
                        .environmentObject(appdata)
                        
                    
                    let vc = UIHostingController(rootView: view)
            
                    appdata.navigation?.show(vc, sender: nil)
                }
            Divider()
            StepListView(title: "Tanaman dan Metode", detail: "Kamu Belum Memilih",num: 3, garden: garden)
                .onTapGesture {
                    let view = PlantAndMethodeView(garden:garden)
                        .environmentObject(appdata)
                        
                    let vc = UIHostingController(rootView: view)
            
                    appdata.navigation?.show(vc, sender: nil)
                }
            Divider()
        }
    }
    
    var locationView: some View{
//        let garden =  UserDefaultService.shared.currentGarden
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .ceiling
        formatter.maximumFractionDigits = 2
        
        return VStack(alignment:.leading){
            HStack(spacing: 8){
                
                ZStack{
                    Circle().foregroundColor(garden.currentGarden.sizeArea.isZero ? Color("myGray") : Color("myGreen"))
                    
                    Text("\(1)")
                        .foregroundColor(!garden.currentGarden.sizeArea.isZero ? Color("myGray") : Color("myGreen"))
                        .bold()
                        .font(.system(size: 17))
                }.frame(width: 28, height: 28)
                Text("PENGUKURAN LOKASI")
                    .foregroundColor(garden.currentGarden.sizeArea.isZero ? Color("myDarkGray"): Color("myGreen"))
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                Spacer()
            }
            if garden.currentGarden.sizeArea.isZero{
                Text("Kamu belum Mengukur")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                    .fontWeight(.light)
            }else{
                HStack(spacing:5){
                    Text("Luas")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                    Text("\(formatter.string(for: garden.currentGarden.sizeArea/10000.0) ?? "") m²")
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                }
                HStack(spacing:5){
                    Text("Suhu")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                    Text("\(formatter.string(for: garden.currentGarden.temp) ?? "")° C")
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    Text("Kelembapan")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                    Text("\(formatter.string(for: garden.currentGarden.humid) ?? "")%")
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                }
            }
            
//            VStack(alignment:.leading){
//
//                Text(!garden.currentGarden.sizeArea.isZero ?
//                     "\(Image(systemName: "square.grid.3x3.square")) \(formatter.string(for: garden.currentGarden.sizeArea/10000.0) ?? "") m2 \(Image(systemName: "thermometer")) \(formatter.string(for: garden.currentGarden.temp) ?? "")° \(Image(systemName: "barometer")) \(formatter.string(for: garden.currentGarden.humid) ?? "")%" :
//                        "Kamu Belum Mengukur"
//                )
//                    .font(.system(size: 14))
//            }
//            Spacer()
//            Image(systemName: "chevron.right")
        }.padding(.horizontal).padding(.bottom)
    }
    
    var lighting: some View{
        //        let garden =  UserDefaultService.shared.currentGarden
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .ceiling
        formatter.maximumFractionDigits = 2
        
        return VStack(alignment:.leading){
            HStack(spacing: 8){
                ZStack{
                    Circle().foregroundColor(garden.currentGarden.candleLight.isZero ? Color("myGray") : Color("myGreen"))
                    Text("\(2)")
                        .foregroundColor(!garden.currentGarden.candleLight.isZero ? Color("myGray") : Color("myGreen"))
                        .bold()
                        .font(.system(size: 17))
                }.frame(width: 28, height: 28)
                Text("PENGUKURAN CAHAYA")
                    .foregroundColor(garden.currentGarden.candleLight.isZero ? Color("myDarkGray"): Color("myGreen"))
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                Spacer()
            }
            if garden.currentGarden.candleLight.isZero{
                Text("Kamu belum Mengukur")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                    .fontWeight(.light)
            }else{
                HStack(spacing:5){
                    Text("Intensitas")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                    Text("\(formatter.string(for: garden.currentGarden.candleLight) ?? "") fc")
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                }
                HStack(spacing:5){
                    Text("Lampu Tambahan")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                    if garden.currentGarden.candleLightNeed == 0{
                        Text("Belum Memilih Tanaman")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                    } else if garden.currentGarden.candleLightNeed >= Int(garden.currentGarden.candleLight){
                        Text("Diperlukan")
                            .foregroundColor(.red)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                    }else{
                        Text("Tidak Diperlukan")
                            .foregroundColor(Color("myGreen"))
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                    }
                    
                    
                }
            }
            
            //            VStack(alignment:.leading){
            //
            //                Text(!garden.currentGarden.sizeArea.isZero ?
            //                     "\(Image(systemName: "square.grid.3x3.square")) \(formatter.string(for: garden.currentGarden.sizeArea/10000.0) ?? "") m2 \(Image(systemName: "thermometer")) \(formatter.string(for: garden.currentGarden.temp) ?? "")° \(Image(systemName: "barometer")) \(formatter.string(for: garden.currentGarden.humid) ?? "")%" :
            //                        "Kamu Belum Mengukur"
            //                )
            //                    .font(.system(size: 14))
            //            }
            //            Spacer()
            //            Image(systemName: "chevron.right")
        }.padding()
    }
    
}

struct StepListView: View{
    
    @State var title  = ""
    @State var detail  = ""
    
    @State var num = 1
    @State var color = Color("myGray")
    @State var tint = Color("myGreen")
    @ObservedObject var garden : UserDefaultService
    
    var body: some View{
        //        let garden =  UserDefaultService.shared.currentGarden
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .ceiling
        formatter.maximumFractionDigits = 2
        
        return VStack(alignment:.leading){
            HStack(spacing: 8){
                
                ZStack{
                    Circle().foregroundColor(garden.currentGarden.listTools.isEmpty ? Color("myGray") : Color("myGreen"))
                    
                    Text("\(3)")
                        .foregroundColor(!garden.currentGarden.listTools.isEmpty ? Color("myGray") : Color("myGreen"))
                        .bold()
                        .font(.system(size: 17))
                }.frame(width: 28, height: 28)
                Text("TANAMAN DAN METODE")
                    .foregroundColor(garden.currentGarden.listTools.isEmpty ? Color("myDarkGray"): Color("myGreen"))
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                Spacer()
            }
            if garden.currentGarden.listTools.isEmpty{
                Text("Kamu belum Memilih")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                    .fontWeight(.light)
            }else{
                HStack(spacing:5){
                    Text("Tanaman")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                    Text("\(garden.currentGarden.plant)")
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                }
                HStack(spacing:5){
                    
                    Text("Metode")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                    Text("\(garden.currentGarden.methode)")
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                }
            }
        }.padding()
    }
}


struct GardenJournalView: View{
    @State var height : CGFloat = 242.0
    @State var showAlert : Bool = false
    var body: some View{
        ZStack{
            Image("dashboardEmpty")
                .resizable()
                .padding(50)
                .opacity(0.3)
            VStack{
                
                HStack{
                    Text("Beli Peralatanmu")
                        .foregroundColor(Color("myGreen"))
                        .font(.system(size: 20))
                        .bold()
                    Spacer()
                }.padding()
                Spacer()
                Text("Isi jurnal perjalanan berkebunmu disini, ada panduan bertanam juga loh")
                    .foregroundColor(Color("myDarkGray"))
                    .font(.system(size: 20))
                    .bold()
                    .multilineTextAlignment(.center)
                Spacer()
                CustomButtonView(title:"Sambungkan Journal") {
                    showAlert.toggle()
                }.padding()
            }
        }.frame( height: height)
            .padding().alert(isPresented: $showAlert) {
                Alert(title: Text("Coming Soon"), message: Text("Pada pengembangan selanjutnya kami akan membantumu bertanam dengan memonitor kebunmu setiap hari. kami juga akan membantumu dengan teknologi iOT untuk mempermudah proses bertanam."))
            }
    }
}
