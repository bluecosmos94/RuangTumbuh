//
//  PlantAndMethodeView.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 27/11/21.
//

import SwiftUI

struct PlantAndMethodeView: View {
    
    @State var notVeryRecomend:[PlantDetailItem] = PlantDummy.data.filter{UserDefaultService.shared.currentGarden.candleLight<$0.footcandle}
    @State var recPlants:[PlantDetailItem] = PlantDummy.data.filter{UserDefaultService.shared.currentGarden.candleLight>=$0.footcandle}
    
    @EnvironmentObject var appdata : AppData
    @ObservedObject var garden : UserDefaultService
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("myGray"))
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        Text("Ini adalah rekomendasi tanaman dan metode yang cocok dengan kondisi area yang sudah kamu tentukan.")
                            .multilineTextAlignment(.leading)
                            .padding()
                            .foregroundColor(Color("myDarkGray"))
                        HStack{
                            
                            Text("Rekomendasi Tanaman")
                                .foregroundColor(Color("myGreen"))
                                .font(.system(size: 20))
                                .bold()
                            Spacer()
                        }.padding()
                        if recPlants.count>0{
                            ForEach((0...recPlants.count-1),id: \.self){ i in
                                
                                PlantListView(plant: recPlants[i])
                                    .onTapGesture {
                                        garden.currentPlant = recPlants[i]
                                        garden.currentGarden.candleLightNeed = Int(recPlants[i].footcandle)
                                        let view = PlantDetailView(plantDetail: recPlants[i],garden:garden)
                                            .environmentObject(appdata)
                                        let vc = UIHostingController(rootView: view)
                                        appdata.navigation?.show(vc, sender: nil)
                                    }
                                Divider()
                            }
                        }
                        HStack{
                            Text("Rekomendasi Dengan Penyesuaian")
                                .foregroundColor(Color("myGreen"))
                                .font(.system(size: 20))
                                .bold()
                            Spacer()
                        }.padding()
                        
                        if notVeryRecomend.count>0{
                            ForEach((0...notVeryRecomend.count-1),id: \.self){ idx in
                                PlantListView(plant: notVeryRecomend[idx],desc: "Butuh cahaya tambahan.")
                                    .onTapGesture {
                                        garden.currentPlant = notVeryRecomend[idx]
                                        garden.currentGarden.candleLightNeed = Int(notVeryRecomend[idx].footcandle)
                                        let view = PlantDetailView(plantDetail: notVeryRecomend[idx],garden:garden)
                                            .environmentObject(appdata)
                                        let vc = UIHostingController(rootView: view)
                                        appdata.navigation?.show(vc, sender: nil)
                                    }
                                Divider()
                            }
                        }
                    }.background(Color.white)
                }
            }
            
            .background(Color("myGray"))

            
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Tanaman Dan Metode")
            .navigationBarItems(leading:
                                    Button(action: {
                appdata.navigation?.popViewController(animated: true)
            }, label: {
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color("myYellow"))
                    Text(garden.currentGarden.name)
                        .foregroundColor(Color("myYellow"))
                }
            })
            )
                
        }.background(Color("myGray")).navigationViewStyle(StackNavigationViewStyle())
    }
}


struct PlantListView: View{
    
    @State var plant = PlantDetailItem()
    @State var desc = ""
    
    var body: some View{
        HStack{
            ZStack{
                Circle().foregroundColor(Color("myGray"))
                
                Image(plant.image)
                    .resizable()
                    .frame(width: 40, height: 41)
                    
                    
            }.frame(width: 50, height: 50)
            VStack(alignment:.leading){
                Text(plant.image)
                    .font(.system(size: 18))
                    .bold()
                Text(desc.isEmpty ? plant.masaTanam : desc)
                    .foregroundColor(desc.isEmpty ? Color("myGreen") : .red )
                    .font(.system(size: 14))
            }
            Spacer()
            Image(systemName: "chevron.right")
        }.padding().frame( height: 80)
    }
}



struct PlantDetailItem{
    var name:String = ""
    var masaTanam:String = ""
    var masaTanamDetail:String = ""
    var saranKonsumsi:String = ""
    var image = ""
    var footcandle:Float = 0.0
}
