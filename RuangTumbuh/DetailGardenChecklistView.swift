//
//  DetailGardenChecklistView.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 28/11/21.
//

import SwiftUI

struct DetailGardenChecklistView: View {
    @EnvironmentObject var appdata : AppData
    @ObservedObject var garden : UserDefaultService
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("myGray"))
                ScrollView{
                    VStack{
                        imageHeader
                        title
                        informasi
                        tools
                        
                    }
                }
            }.navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button("Selesai"){
                    let vc = appdata.navigation?.viewControllers
                    appdata.navigation?.popToViewController(vc![1], animated: true)
                })
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    var imageHeader : some View{
        Image(uiImage: UIImage(data: garden.currentGarden.image) ?? UIImage())
            .centerCropped()
            .frame(height: 280)
    }
    
    var title : some View{
        ZStack{
            Rectangle()
                .foregroundColor(.white)
            HStack {
                Text("Calon Kebunku")
                    .foregroundColor(Color("myGreen"))
                    .bold()
                .font(.system(size: 30))
                Spacer()
            }.padding()
        }.frame(height:UIScreen.screenHeight/10)
    }
    
    var informasi : some View{
        ZStack{
            Rectangle()
                .foregroundColor(.white)
            VStack {
                
                Group{
                    HStack {
                        Text("Informasi")
                            .foregroundColor(Color("myGreen"))
                            .bold()
                        .font(.system(size: 18))
                        Spacer()
                    }.padding()
                    HStack {
                        Text("Luas Area")
                            .bold()
                        .font(.system(size: 16))
                        Spacer()
                        Text("\((garden.currentGarden.sizeArea/10000).clean) m2")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.bottom)
                    HStack {
                        Text("Temperatur")
                            .bold()
                        .font(.system(size: 16))
                        Spacer()
                        Text("\(garden.currentGarden.temp.clean)°C")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.bottom)
                    HStack {
                        Text("Kelembapan")
                            .bold()
                        .font(.system(size: 16))
                        Spacer()
                        Text("\(garden.currentGarden.humid)%")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.bottom)
                    HStack {
                        Text("Paparan matahari")
                            .bold()
                        .font(.system(size: 16))
                        Spacer()
                        Text("\(garden.currentGarden.kelvin)")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.bottom)
                    HStack {
                        Text("Cahaya")
                            .bold()
                        .font(.system(size: 16))
                        Spacer()
                        Text("\(garden.currentGarden.candleLight.clean) fc")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.bottom)
                }
                Divider()
                Group{
                    HStack {
                        Text("Jenis Metode")
                            .bold()
                        .font(.system(size: 16))
                        Spacer()
                        Text("\(garden.currentMethode.name)")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.bottom)
                    HStack {
                        Text("Jenis Tanaman")
                            .bold()
                        .font(.system(size: 16))
                        Spacer()
                        Text("\(garden.currentPlant.name)")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.bottom)
                    HStack {
                        Text("Waktu Berkebun")
                            .bold()
                        .font(.system(size: 16))
                        Spacer()
                        Text("\(garden.currentPlant.masaTanam)")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.bottom)
                    HStack {
                        Text("Estimasi Biaya")
                            .bold()
                        .font(.system(size: 16))
                        Spacer()
                        Text("\(garden.currentMethode.priceRange)")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.bottom)
                    HStack {
                        Text("Estimasi Hasil Panen")
                            .bold()
                        .font(.system(size: 16))
                        Spacer()
                        Text("\(garden.currentGarden.availNum) \(garden.currentPlant.name)")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    }.padding(.horizontal).padding(.bottom)
                }
                
            }
            
        }
    }
    
    var tools : some View{
        ZStack{
            Rectangle()
                .foregroundColor(.white)
            VStack{
                HStack {
                    Text("Peralatan yang Dibutuhkan")
                        .foregroundColor(Color("myGreen"))
                        .bold()
                    .font(.system(size: 18))
                    Spacer()
                }.padding(.horizontal).padding(.top)
                
                HStack {
                    Text("Berikut rangkuman hal yang perlu kamu siapkan")
                        
                    .font(.system(size: 17))
                    Spacer()
                }.padding(.horizontal).padding(.bottom)
                
                if !garden.currentGarden.listTools.isEmpty{
                    ForEach((0...garden.currentGarden.listTools.count-1),id: \.self){ i in
                        let tool = garden.currentGarden.listTools[i]
                        VStack{
                            HStack {
                                Text(tool.name)
                                    .bold()
                                .font(.system(size: 16))
                                Spacer()
                                Text("\(tool.num) buah")
                                    .bold()
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                            }.padding(.horizontal).padding(.bottom)
                            Divider()
                                .padding(.leading)
                        }
                        
                    }
                }
                
            }
        }
    }
}

struct DetailGardenChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        DetailGardenChecklistView( garden: UserDefaultService())
    }
}


extension Float {
    var clean: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .ceiling
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "0.0"
    }
}
