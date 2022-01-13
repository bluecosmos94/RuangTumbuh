//
//  PlantDetailView.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 28/11/21.
//

import SwiftUI

struct PlantDetailView: View {
    @State var plantDetail = PlantDetailItem()
    @EnvironmentObject var appdata : AppData
    @State var isMasaTanam = false
    @State var isPengolahan = false
    @ObservedObject var garden : UserDefaultService
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("myGray"))
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.white)
                                .ignoresSafeArea()
                            Image(plantDetail.name)
                                .resizable()
                        }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/3)
                        
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.white)
                                .ignoresSafeArea()
                            HStack{
                                Text(plantDetail.name)
                                    .foregroundColor(Color("myGreen"))
                                    .font(.system(size: 28))
                                    .bold()
                                Spacer()
                            }.padding()
                        }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/12)
                        detailDropDown
                        methodeAvail
                    }
                }
            }.background(Color("myGray"))
            
            
                .navigationBarTitleDisplayMode(.inline)
//                .navigationTitle("Tanaman Dan Metode")
                .navigationBarItems(leading:
                                        Button(action: {
                    appdata.navigation?.popViewController(animated: true)
                }, label: {
                    HStack{
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("myYellow"))
                        Text("Tanaman Dan Metode")
                            .foregroundColor(Color("myYellow"))
                    }
                })
                )
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    var detailDropDown: some View{
        ZStack{
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
            VStack{
                if isMasaTanam{
                    DropUpView(title: "Masa Tanam", detail: plantDetail.masaTanam)
                        .onTapGesture {
                            isMasaTanam.toggle()
                        }
                }else{
                    DropDownView(title: "Masa Tanam")
                        .onTapGesture {
                            isMasaTanam.toggle()
                        }
                }
                Divider()
                if isPengolahan{
                    DropUpView(title: "Saran Pengolahan", detail: plantDetail.saranKonsumsi)
                        .onTapGesture {
                            isPengolahan.toggle()
                        }
                }else{
                    DropDownView(title: "Saran Pengolahan")
                        .onTapGesture {
                            isPengolahan.toggle()
                        }
                }
                
                Divider()
            }
        }
    }
    
    var methodeAvail : some View{
        ZStack{
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Text("Metode Penanaman")
                        .foregroundColor(Color("myGreen"))
                        .font(.system(size: 20))
                        .bold()
                    Spacer()
                }.padding()
                ForEach((0...MethodeDummy.data.count-1),id: \.self){i in
                    MethodeAvailableView(methode: MethodeDummy.data[i])
                        .onTapGesture {
                            UserDefaultService.shared.currentMethode = MethodeDummy.data[i]
                            let view = MethodeDetailView(methodeDetail: MethodeDummy.data[i],garden:garden)
                                .environmentObject(appdata)
                            let vc = UIHostingController(rootView: view)
                            appdata.navigation?.show(vc, sender: nil)
                        }
                    Divider()
                }
                
            }
        }
        
    }
}

struct DropDownView : View{
    @State var title = ""
    var body: some View{
        HStack{
            Text(title)
            Spacer()
            Image(systemName: "chevron.down")
        }.padding()
            .frame(height: 55)
    }
}
struct DropUpView : View{
    @State var title = ""
    @State var detail = ""
    var body: some View{
        VStack{
            HStack{
                Text(title)
                    .foregroundColor(Color("myGreen"))
                    .bold()
                Spacer()
                Image(systemName: "chevron.up")
                    .foregroundColor(Color("myGreen"))
            }.padding()
            HStack{
                Text(detail)
                    .multilineTextAlignment(.leading)
                Spacer()
            }.padding(.horizontal)
            
        }
        
    }
}


struct MethodeAvailableView: View{
    
    @State var methode = MethodeDetailItem()
    
    
    var body: some View{
        HStack{
            ZStack{
                Circle().foregroundColor(Color("myGray"))
                
                Image(methode.name)
                    .resizable()
                    .frame(width: 40, height: 41)
                    .cornerRadius(25)
                    
                    
            }.frame(width: 50, height: 50)
            VStack(alignment:.leading){
                Text(methode.name)
                    .font(.system(size: 18))
                    .bold()
                Text(methode.level)
                    .foregroundColor(colorForMethode())
                    .font(.system(size: 14))
            }
            Spacer()
            Image(systemName: "chevron.right")
        }.padding().frame( height: 80)
    }
    
    func colorForMethode()->Color{
        if methode.level == "Menengah" {
            return .orange
        }else if methode.level == "Susah" {
            return .red
        }else{
            return Color("myGreen")
        }
        
    }
}


struct MethodeDetailItem{
    var name = ""
    var desc = ""
    var priceRange = ""
    var level = ""
    var levelDesc = ""
    var positiv = ""
    var negative = ""
    var availNum = 0
    var tools = [ToolsItem]()
    var open = false
}

