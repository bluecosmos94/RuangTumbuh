//
//  ReferenceView.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 27/11/21.
//

import SwiftUI

struct ReferenceView: View {
    @State var title = "Referensi Metode"
    @State var images : [String] = ["pok-choy","romane"]
    @State var height : CGFloat = 194.0
    @State var canSeeAll = false
    @EnvironmentObject var appdata: AppData
    
    var body: some View{
        VStack{
            HStack{
                Text(title)
                    .font(.system(size: 17))
                    .foregroundColor(Color("myGreen"))
                Spacer()
                if canSeeAll{
                    Button("Lihat Semua"){
                        if title == "REFERENSI TANAMAN"{
                            let view = PlantReferenceView(plants: PlantDummy.data)
                                .environmentObject(appdata)
                            let vc = UIHostingController(rootView: view)
                            appdata.navigation?.show(vc, sender: nil)
                        }
                        if title == "REFERENSI METODE"{
                            let view = MethodeReferenceView().environmentObject(appdata)
                            let vc = UIHostingController(rootView: view)
                            appdata.navigation?.show(vc, sender: nil)
                        }
                        if title == "Rekomendasi Untukmu"{
                            // untuk rekomendasi di GardenDetailView
                        }
                    }
                    .foregroundColor(Color("accentColor"))
                    .font(.system(size: 14))
                }
            }.padding()
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                ImageReference(imageName: images[0] )
                Spacer()
                ImageReference(imageName: images[1] )
                Spacer()
                ImageReference(imageName: images[2] )
                Spacer()
            }.padding(.bottom)
        }.frame( height: height)
    }
}

struct ReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        ReferenceView()
    }
}

struct ImageReference : View{
    @State var imageName : String
    var body: some View{
        VStack{
            
            CircleImage(name: imageName)
            Text(imageName)
                .bold()
                .multilineTextAlignment(.center)
                .font(.system(size: 12))
                .foregroundColor(Color("myDarkGray"))
                
        }
    }
    
}

struct CircleImage : View{
    @State var name = ""
    var body: some View{
        Image(name)
            .resizable()
            .frame(width: 72, height: 72)
            .cornerRadius(36)
            .background(Circle().foregroundColor(Color("myGray")))
    }
}
