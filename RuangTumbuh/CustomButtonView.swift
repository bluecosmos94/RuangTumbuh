//
//  CustomButtonView.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 27/11/21.
//

import SwiftUI

struct CustomButtonView: View {
    @State var title : String
    @State var color = Color("myGreen")
    
    var action : ()->()
    
    var body: some View{
        Button {
            action()
        } label: {
            ZStack{
                Rectangle()
                    .frame(width: 338, height: 60)
                    .cornerRadius(16)
                    .foregroundColor(color)
                Text(title)
                    .bold()
                    .font(.title3)
                    .foregroundColor(.white)
            }
            
        }
    }
}
struct CustomButtonWhiteView: View {
    @State var title : String
    var action : ()->()
    var body: some View{
        Button {
            action()
        } label: {
            ZStack{
                Rectangle()
                    .frame(width: 338, height: 60)
                    .cornerRadius(16)
                    .foregroundColor(Color.white)
                Text(title)
                    .bold()
                    .foregroundColor(Color("myGreen"))
            }
            
        }
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(title: "Continue") {
            
        }
    }
}
