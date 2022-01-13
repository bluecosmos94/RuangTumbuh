//
//  MethodeReferenceDetailView.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 08/12/21.
//

import SwiftUI

struct MethodeReferenceDetailView: View {
    @State var method = MethodeDetailItem()
    @EnvironmentObject var appdata: AppData
    @State var isOpen: [Bool] = [false, false, false, false, false]
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("myGray"))
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        headView
                        information
                    }
                }
            }.background(Color("myGray"))
                .onAppear(perform: {
                    appdata.navigation?.navigationBar.isHidden = true
                })
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Detail Methode")
                .navigationBarItems(leading:
                                        Button(action: {
                    appdata.navigation?.popViewController(animated: true)
                }, label: {
                    HStack{
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("myYellow"))
                        Text("Referensi Methode")
                            .foregroundColor(Color("myYellow"))
                    }
                })
                )
        }
    }
    
    var headView : some View{
        VStack{
            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .ignoresSafeArea()
                Image(method.name)
                    .resizable()
            }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/3)
            
            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .ignoresSafeArea()
                HStack{
                    Text(method.name)
                        .foregroundColor(Color("myGreen"))
                        .font(.system(size: 28))
                        .bold()
                    Spacer()
                }.padding()
            }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/12)
          
        }
    }
    
    var information : some View{
        ZStack{
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
            
            VStack{
                if isOpen[0]{
                    DropUpView(title: "Rentang Harga", detail: method.priceRange)
                        .onTapGesture {
                            isOpen[0].toggle()
                        }
                }else{
                    DropDownView(title: "Rentang Harga")
                        .onTapGesture {
                            isOpen[0].toggle()
                        }
                }
                Divider()
                    .padding(.leading)
                if isOpen[1]{
                    DropUpView(title: "Tingkat Operasional", detail: method.level+"\n"+method.levelDesc)
                        .onTapGesture {
                            isOpen[1].toggle()
                        }
                }else{
                    DropDownView(title: "Tingkat Operasional")
                        .onTapGesture {
                            isOpen[1].toggle()
                        }
                }
                
                Divider()
                    .padding(.leading)
                if isOpen[2]{
                    DropUpView(title: "Kelebihan", detail: method.positiv)
                        .onTapGesture {
                            isOpen[2].toggle()
                        }
                }else{
                    DropDownView(title: "Kelebihan")
                        .onTapGesture {
                            isOpen[2].toggle()
                        }
                }
                Divider()
                    .padding(.leading)
                if isOpen[3]{
                    DropUpView(title: "Kekurangan", detail: method.negative)
                        .onTapGesture {
                            isOpen[3].toggle()
                        }
                }else{
                    DropDownView(title: "Kekurangan")
                        .onTapGesture {
                            isOpen[3].toggle()
                        }
                }
                
                Divider()
                    .padding(.leading)
                if isOpen[4]{
                    ToolDropUpView(title: "Peralatan",methodeDetail: method){
                        isOpen[4].toggle()
                    }
                }else{
                    DropDownView(title: "Peralatan")
                        .onTapGesture {
                            isOpen[4].toggle()
                        }
                }
                
                
            }
        }
    }
}

struct MethodeReferenceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MethodeReferenceDetailView()
    }
}
