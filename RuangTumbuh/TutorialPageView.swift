//
//  TutorialPageView.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 27/11/21.
//

import SwiftUI

struct TutorialPageView: View {
    
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
                        Image(title)
                            .resizable()
                            .frame(width: width, height: 200)
                            .scaledToFit()
                            .clipped()
                            .padding(50)
                        
                        Text(tutorial)
                            .foregroundColor(Color("myGreen"))
                            .font(.system(size: 20))
                            .bold()
                            .padding()
                        Text(desc)
                            .padding()
                            .foregroundColor(Color("myDarkGray"))
                            .multilineTextAlignment(.center)
                        Spacer()
                        
                    }.background(Color.white).padding(.bottom)
                        
                    
                    CustomButtonView(title: title == "Pengukuran Lokasi" ? "Ayo Ukur Lokasi" : "Ayo Ukur Cahaya") {
                        if title == "Pengukuran Lokasi"{
                            let storyboard = UIStoryboard(name: "MainFeature", bundle: nil)
                            let viewController = storyboard.instantiateViewController(withIdentifier: "measure")
                            let nav = UINavigationController(rootViewController: viewController)
                            
                            nav.modalPresentationStyle = .fullScreen
                            nav.modalTransitionStyle = .crossDissolve
                            
                            let wrapView = WrappARMeasure(garden:garden).environmentObject(appdata).ignoresSafeArea()
                            let vc = UIHostingController(rootView: wrapView)

                            appdata.navigation?.show(vc, sender: nil)

                        }
                        if title == "Pengukuran Cahaya"{
                            let storyboard = UIStoryboard(name: "CandleLight", bundle: nil)
                            
                            let viewController = storyboard.instantiateViewController(withIdentifier: "check")
                            let nav = UINavigationController(rootViewController: viewController)
                            
                            nav.modalPresentationStyle = .fullScreen
                            nav.modalTransitionStyle = .crossDissolve
                            
                            let wrapView = WrappARCandleLight(garden:garden).environmentObject(appdata).ignoresSafeArea()
                            let vc = UIHostingController(rootView: wrapView)
                            
                            appdata.navigation?.show(vc, sender: nil)
                            
                        }
                    }
                    CustomButtonWhiteView(title: "Tutorial"){
                        
                    }
                }
            }
            
            .background(Color("myGray"))

            
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle(title)
            .navigationBarItems(leading:
                                    Button(action: {
                appdata.navigation?.popViewController(animated: true)
            }, label: {
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color("myYellow"))
                    Text(UserDefaultService.shared.currentGarden.name)
                        .foregroundColor(Color("myYellow"))
                }
            })
            )
                
        }.background(Color("myGray")).navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TutorialPageView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialPageView( garden: UserDefaultService())
    }
}
