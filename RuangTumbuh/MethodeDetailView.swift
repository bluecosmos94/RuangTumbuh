//
//  MethodeDetailView.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 28/11/21.
//

import SwiftUI

struct MethodeDetailView: View {
    @State var methodeDetail = MethodeDetailItem()
    @EnvironmentObject var appdata : AppData
    @State var isOpen : [Bool] = [false,false,false,false,false]
    @ObservedObject var garden : UserDefaultService
    
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
            
            
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                                        Button(action: {
                    appdata.navigation?.popViewController(animated: true)
                }, label: {
                    HStack{
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color("myYellow"))
                        Text(UserDefaultService.shared.currentPlant.name)
                            .foregroundColor(Color("myYellow"))
                    }
                })
                )
                .navigationBarItems(trailing: Button(action: {
//                    appdata.navigation?.popViewController(animated: true)
                    let view = DonePMCChoseView(garden:garden)
                        .environmentObject(appdata)
                    let vc = UIHostingController(rootView: view)
                    appdata.navigation?.show(vc, sender: nil)
                }, label: {
                    HStack{
                        Text("Simpan")
                            .foregroundColor(Color("myYellow"))
                    }
                }))
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    var headView : some View{
        VStack{
            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .ignoresSafeArea()
                Image(methodeDetail.name)
                    .resizable()
            }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/3)
            
            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .ignoresSafeArea()
                HStack{
                    Text(methodeDetail.name)
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
                    DropUpView(title: "Rentang Harga", detail: methodeDetail.priceRange)
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
                    DropUpView(title: "Tingkat Operasional", detail: methodeDetail.level+"\n"+methodeDetail.levelDesc)
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
                    DropUpView(title: "Kelebihan", detail: methodeDetail.positiv)
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
                    DropUpView(title: "Kekurangan", detail: methodeDetail.negative)
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
                    ToolDropUpView(title: "Peralatan",methodeDetail: methodeDetail){
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
class SheetMananger: ObservableObject{
    
    enum Sheet{
        case Red
        case Blue
    }
    
    @Published var showSheet = false
    @Published var whichTools: ToolsItem? = nil
}
struct ToolDropUpView : View{
    @State var title = ""
    @State var detail = ""
    @State var methodeDetail = MethodeDetailItem()
    
    var action : ()->()?
    
    
    
    @StateObject var sheetManager = SheetMananger()
    
    var body: some View{
        VStack{
            VStack{
                HStack{
                    Text(title)
                        .foregroundColor(Color("myGreen"))
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.up")
                        .foregroundColor(Color("myGreen"))
                }.padding()
                HStack{
                    Text(detail)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }.padding(.horizontal)
            }.onTapGesture {
                action()
            }
            ForEach((0...methodeDetail.tools.count-1),id: \.self){i in
                ToolToDetailView(tool: methodeDetail.tools[i]){
                    self.sheetManager.whichTools = methodeDetail.tools[i]
                    self.sheetManager.showSheet.toggle()
                }
                Divider()
                    .padding(.leading)
                
            }
        }.sheet(isPresented: $sheetManager.showSheet) {
            
        } content: {
            if !(self.sheetManager.whichTools?.name.isEmpty)!{
                ToolsDetailView(tools: self.sheetManager.whichTools ?? ToolsItem())
            }
            
        }

        
    }
}

struct ToolToDetailView:View{
    @State var tool : ToolsItem = ToolsItem()
    var action : ()->()
    var body: some View{
        HStack{
            Text(tool.name)
            Spacer()
            Button("lihat"){
                action()
            }
            .foregroundColor(Color("myGreen"))
        }.padding()
        
    }
}

