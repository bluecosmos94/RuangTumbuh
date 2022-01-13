//
//  DashboardView.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 27/11/21.
//

import SwiftUI

struct DashboardView: View {
    
    @EnvironmentObject var appdata : AppData
    @State var isEmpty = true
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("myGray"))
                    .ignoresSafeArea()
                VStack(spacing:0){
                    ScrollView{
                        VStack{
                            if UserDefaultService.shared.gardens.isEmpty{
                                
                                DashboardEmptyView(height: UIScreen.screenHeight/3.2)
                                    .background(Color.white)
                            }else{
                                
                                DashboardNotEmptyView()
                                    .background(Color.white)
                            }
                            ReferenceView(title: "REFERENSI TANAMAN", images: ["Bok-Choy","Romaine Lettuce","Green Lettuce"], height: UIScreen.screenHeight * 0.23,canSeeAll: true)
                                .background(Color.white)
                            ReferenceView(title: "REFERENSI METODE", images: ["NFT Hidroponik","Wick Hidroponik","Water Culture"] , height: UIScreen.screenHeight * 0.23,canSeeAll: true)
                                .background(Color.white)
                            Spacer()
                            
                        }
                    }.padding(0)
                }
            }.onAppear {
                appdata.navigation?.navigationBar.tintColor = UIColor(named: "myGreen")
                appdata.navigation?.isNavigationBarHidden = true
            }
            
            .navigationBarTitle("Ayo Bertanam")
            .navigationBarTitleDisplayMode(.large)
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DashboardEmptyView : View{
    @State var height : CGFloat = 242.0
    @EnvironmentObject var appdata : AppData
    
    
    var body: some View{
        ZStack{
            Image("dashboardEmpty")
                .resizable()
                .padding(50)
                .opacity(0.3)
            VStack{
                
                HStack{
                    Text("KEBUNKU")
                        .foregroundColor(Color("myGreen"))
                        .font(.system(size: 17))
                    Spacer()
                }.padding()
                Spacer()
                Text("Kamu Belum Punya Kebun")
                    .foregroundColor(Color("myDarkGray"))
                    .font(.system(size: 20))
                Spacer()
                CustomButtonView(title: "+ Tambah Kebun Baru") {
                    //TODO: go to naming garden
                    
                    let mview = GardenNameView()
                        .environmentObject(appdata)
                        
                    let vc = UIHostingController(rootView:mview)
                    appdata.navigation?.show(vc, sender: nil)
                }.padding()
            }
        }.frame( height: height)
    }
}

struct DashboardNotEmptyView : View{
    @EnvironmentObject var appdata : AppData
    
    
    var body: some View{
        VStack{
            
            HStack{
                Text("KEBUNKU")
                    .foregroundColor(Color("myGreen"))
                    .font(.system(size: 17))
                    .bold()
                Spacer()
            }.padding()
            Spacer()
            
            ForEach((0...UserDefaultService.shared.gardens.count-1), id: \.self){ i in
                GardenListView(garden: UserDefaultService.shared.gardens[i] ?? GardenModel())
                    .onTapGesture {
                        //TODO: go to detail garden
                        UserDefaultService.shared.currentGarden = UserDefaultService.shared.gardens[i] ?? GardenModel()
//                        gardens.currentGarden = gardens.gardens[i] ?? GardenModel()
                        let mview = GardenDetailView()
                            .environmentObject(appdata)
                            
                        let vc = UIHostingController(rootView:mview)
                        appdata.navigation?.show(vc, sender: nil)
                    }
                Divider()
            }
            AddGardenListView().onTapGesture {
                //TODO: go to naming garden
                
                let mview = GardenNameView()
                    .environmentObject(appdata)
                    
                let vc = UIHostingController(rootView:mview)
                appdata.navigation?.show(vc, sender: nil)
            }
        }
        
    }
    
    func delete(at offsets: IndexSet) {
//            users.remove(atOffsets: offsets)
    }
    
}

struct GardenListView: View{
    @State var garden : GardenModel = GardenModel()
    
    var body: some View{
        HStack{
            ZStack{
                Circle().foregroundColor(Color("myGray"))
                
                if !garden.image.isEmpty{
                    Image(uiImage: UIImage(data: garden.image ) ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: 72, height: 72)
                        .clipped()
                        .cornerRadius(36)
                        .foregroundColor(Color("myGreen"))
                }else{
                    Text(getFirstLetter())
                        .foregroundColor(Color("myGreen"))
                        .fontWeight(.regular)
                        .font(.system(size: 34))

                }
                    
            }.frame(width: 72, height: 72)
            VStack(alignment:.leading){
                Text(garden.name)
                    .font(.system(size: 18))
                    .bold()
                Text("Ayo tentukan Kebunmu")
                    .font(.system(size: 14))
                    .foregroundColor(Color("myDarkGray"))
            }
            Spacer()
            Image(systemName: "chevron.right")
        }.padding().frame( height: 104)
    }
    
    
    func getFirstLetter()->String{
        let stringInput = garden.name
        let stringInputArr = stringInput.components(separatedBy:" ")
        var stringNeed = ""

        for string in stringInputArr {
            stringNeed += String(string.first!)
        }

        return stringNeed
    }
}

struct AddGardenListView : View{
    var body: some View{
        HStack{
            ZStack{
                Circle().foregroundColor(Color("myGray"))
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(36)
                    .foregroundColor(Color("myGreen"))
                    
            }.frame(width: 72, height: 72)
            
            VStack(alignment:.leading){
                Text("Tambah Kebun")
                    .font(.system(size: 18))
                    .bold()
                    .foregroundColor(Color("myDarkGray"))
                Text("Buat area baru disekitarmu")
                    .font(.system(size: 14))
                    .foregroundColor(Color("myDarkGray"))
            }
            Spacer()

        }.padding().frame( height: 104)
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
