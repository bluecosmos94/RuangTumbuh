//
//  CustomHeaderView.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 27/11/21.
//

import SwiftUI

struct CustomHeaderView: View {
    @State var name = ""
    var body: some View {
        ZStack{
            Rectangle()
            HStack{
                VStack{
                    Spacer()
                    Text(name)
                        .bold()
                        .foregroundColor(Color("myGreen"))
                        .font(.system(size: 30))
                }
                
                Spacer()
            }.padding()
            
            
        }.frame(height: 138)
            .foregroundColor(
                Color("myGray")
            )
            .ignoresSafeArea()
        
    }
}

struct CustomHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomHeaderView()
    }
}
