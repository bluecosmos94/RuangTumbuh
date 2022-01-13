//
//  PlanCardView.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 28/11/21.
//

import SwiftUI

struct PlanCardView: View {
    
    @EnvironmentObject var appdata : AppData
    @ObservedObject var garden : UserDefaultService
    var action : ()->()
    
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
            VStack{
                HStack {
                    Text("Perencanaan Kebunmu")
                        .foregroundColor(Color("myGreen"))
                        .bold()
                    .font(.system(size: 20))
                    Spacer()
                }.padding()
                HStack(spacing:0){
                    Spacer()
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("myGray"))
                        Image(UserDefaultService.shared.currentGarden.methode)
                            .resizable()
                        
                    }.frame(width: UIScreen.screenWidth/2.2, height: 140)
                    
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("myGray"))
                        Image(UserDefaultService.shared.currentGarden.plant)
                            .resizable()
                        
                    }.frame(width: UIScreen.screenWidth/2.2, height: 140)
                    Spacer()
                }
                
                HStack{
                    Text("\(UserDefaultService.shared.currentGarden.methode), \(UserDefaultService.shared.currentGarden.plant)")
                        .foregroundColor(Color("myGreen"))
                        
                    Spacer()
                }.padding(.horizontal)
                HStack{
                    Text("Ayo lengkapi perlengkapan yang dibutuhkan")
                        .frame(width: UIScreen.screenWidth/2)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        
                        
                    Spacer()
                    Text("\(Image(systemName: "text.badge.checkmark")) \(garden.currentGarden.listTools.filter{$0.checklist}.count) dari \(garden.currentGarden.listTools.count)")
                        .foregroundColor(garden.currentGarden.listTools.filter{$0.checklist}.count == garden.currentGarden.listTools.count ? Color("myGreen") : .red )
                        
                }.padding(.horizontal).padding(.top,10)
                
                if garden.currentGarden.listTools.filter{$0.checklist}.count == garden.currentGarden.listTools.count{
                    ZStack{
                        Rectangle()
                            .frame(width: 314, height: 60)
                            .cornerRadius(16)
                            .foregroundColor(.white)
                        Text("Sudah Lengkap!")
                            .bold()
                            .foregroundColor(Color("myGreen"))
                    }.onTapGesture {
                        action()
                    }
                    
                }else{
                    
                    CustomButtonView(title: "Lengkapi") {
                        action()
                    }.padding()
                }
            }
        }
    }
}

struct PlanCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlanCardView(garden: UserDefaultService()){
            
        }
    }
}
