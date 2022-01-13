//
//  NameDoneView.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 27/11/21.
//

import SwiftUI

struct NameDoneView: View {
    
    @Binding var gardenName : String
    @Binding var isSheet : Bool
    @EnvironmentObject var appdata : AppData
    
    
    var body: some View {
        VStack{
            Image("farmer")
                .resizable()
                .frame(width:255,height:255)
                .padding(20)
            
            Text("Hore, Kamu sudah memiliki nama kebun")
                .foregroundColor(Color("myGreen"))
                .font(.system(size: 20))
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top,20)
                .padding(.horizontal,50)
            Text("Selanjutnya cari tau yuk kondisi ruangan yang kamu miliki untuk kebunmu")
                .multilineTextAlignment(.center)
                .padding(.bottom,20)
                .padding(.horizontal,50)
            CustomButtonView(title: "Ayo Bertanam", action: {
                
                let gar = GardenModel(name:gardenName)
                UserDefaultService.shared.saveNewGarden(garden: gar)
                
                isSheet.toggle()
                appdata.navigation?.popToRootViewController(animated: true)
            })
        }.padding()
    }
}
