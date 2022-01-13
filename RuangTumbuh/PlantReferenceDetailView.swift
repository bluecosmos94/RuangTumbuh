//
//  PlantReferenceDetailView.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 07/12/21.
//

import SwiftUI

struct PlantReferenceDetailView: View {
    @State var plant = PlantDetailItem()
    @State var isMasaTanam = false
    @State var isPengolahan = false
    @EnvironmentObject var appdata: AppData
    
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
                            Image(plant.image)
                                .resizable()
                        }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3)
                        
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.white)
                                .ignoresSafeArea()
                            HStack{
                                Text(plant.name)
                                    .foregroundColor(Color("myGreen"))
                                    .font(.system(size: 28))
                                    .bold()
                                Spacer()
                            }.padding()
                        }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 12)
                        detailDropDown
                    }
                }
            }.background(Color("myGray"))
                .onAppear(perform: {
                    appdata.navigation?.isNavigationBarHidden = true
                })
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Detail Tanaman")
                .navigationBarItems(leading:
                                        Button(action: {
                    appdata.navigation?.popViewController(animated: true)
                }, label: {
                    HStack{
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("myYellow"))
                        Text("Referensi Tanaman")
                            .foregroundColor(Color("myYellow"))
                    }
                })
                )
        }
    }
    
    var detailDropDown: some View{
        ZStack{
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
            VStack{
                if isMasaTanam{
                    DropUpView(title: "Masa Tanam", detail: plant.masaTanam)
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
                    DropUpView(title: "Saran Pengolahan", detail: plant.saranKonsumsi)
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
}

struct PlantReferenceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantReferenceDetailView()
    }
}
