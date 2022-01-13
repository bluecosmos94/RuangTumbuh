//
//  PlantReferenceView.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 07/12/21.
//

import SwiftUI

struct PlantReferenceView: View {
    @State var plants: [PlantDetailItem] = PlantDummy.data
    @EnvironmentObject var appdata: AppData
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("myGray"))
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        if plants.count > 0 {
                            ForEach((0...plants.count - 1), id:\.self){i in
                                PlantListView(plant: plants[i])
                                    .onTapGesture {
                                        let view = PlantReferenceDetailView(plant: plants[i]).environmentObject(appdata)
                                        let vc = UIHostingController(rootView: view)
                                        appdata.navigation?.show(vc, sender: nil)
                                    }
                                Divider()
                            }
                        }
                    }.background(Color.white).padding()
                }
            }
            
            .background(Color("myGray"))
            .onAppear(perform: {
                appdata.navigation?.navigationBar.isHidden = true
            })
            
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Referensi Tanaman")
            .navigationBarItems(leading:
                                    Button(action: {
                appdata.navigation?.popViewController(animated: true)
            }, label: {
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color("myYellow"))
                    Text("Dashboard")
                        .foregroundColor(Color("myYellow"))
                }
            })
            )
        }
    }
}

struct PlantReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        PlantReferenceView()
    }
}
