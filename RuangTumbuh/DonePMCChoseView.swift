//
//  DonePMCChoseView.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 28/11/21.
//

import SwiftUI

struct DonePMCChoseView: View {
    @State var title = ""
    @State var width = 295.0
    @State var tutorial = ""
    @State var desc = ""
    
    @EnvironmentObject var appdata : AppData
    @ObservedObject var garden : UserDefaultService
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("myGray"))
                    .ignoresSafeArea()
                VStack{
                    VStack{
                        Text("Kamu Memilih")
                            .foregroundColor(Color("myGreen"))
                            .font(.system(size: 28))
                            .bold()
                            .padding()
                        Spacer()
                      
                        HStack{
                            Spacer()
                            VStack{
                                Image(UserDefaultService.shared.currentPlant.name)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .background(Circle().foregroundColor(Color("myGray")))
                                    .cornerRadius(50)
                                    .scaledToFit()
                                    .clipped()
                                    
                                Text(UserDefaultService.shared.currentPlant.name)
                                    .font(.system(size: 16))
                                    .bold()
                                    .padding()
                            }
                            Spacer()
                            VStack{
                                
                                Image(UserDefaultService.shared.currentMethode.name)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .background(Circle().foregroundColor(Color("myGray")))
                                    .cornerRadius(50)
                                    .scaledToFit()
                                    .clipped()
                                Text(UserDefaultService.shared.currentMethode.name)
                                    .font(.system(size: 16))
                                    .bold()
                                    .padding()
                            }
                            Spacer()
                        }
                        Spacer()
                        Text("Hore Kamu Sudah Pilih Tanaman dan Metodemu!")
                            .foregroundColor(Color("myGreen"))
                            .font(.system(size: 20))
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 5)
                        Text("Agar persiapan semakin optimal ayo simulasikan metode yang sudah kamu pilih")
                            .font(.system(size: 14))
                            .foregroundColor(Color("myDarkGray"))
                            .bold()
                            .multilineTextAlignment(.center)
                         
                        Spacer()
                        
                    }.background(Color.white).padding(.bottom)
                        
                    
                    CustomButtonView(title: "Simulasikan Kebunmu") {
                        let view = WrappARAddMethode(garden: garden).ignoresSafeArea()
                            .environmentObject(appdata)
                        let vc = UIHostingController(rootView: view)
                        appdata.navigation?.show(vc, sender: nil)
                    }
                    CustomButtonWhiteView(title: "Tutorial"){
                        
                    }
                }
            }
            
            .background(Color("myGray"))

            
            .navigationBarTitleDisplayMode(.inline)
            
                
        }.background(Color("myGray")).navigationViewStyle(StackNavigationViewStyle())
    }
}
