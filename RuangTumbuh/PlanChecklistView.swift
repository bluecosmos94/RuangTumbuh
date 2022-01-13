//
//  PlanChecklistView.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 28/11/21.
//

import SwiftUI

struct PlanChecklistView: View {
    @EnvironmentObject var appdata : AppData
    
    @ObservedObject var garden : UserDefaultService
    
    @StateObject var sheetManager : SheetMananger = SheetMananger()
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("myGray"))
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        titleHead
                            .frame(height: 280)
                        title
                        toolsList
                    }
                }
            }.navigationBarTitleDisplayMode(.inline)
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
                .sheet(isPresented: $sheetManager.showSheet) {
                    
                } content: {
                    ToolsDetailView(tools: self.sheetManager.whichTools ?? ToolsItem(),canBuy: true)
                }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    var titleHead : some View{
        Image(uiImage: UIImage(data: UserDefaultService.shared.currentGarden.image) ?? UIImage())
            .centerCropped()
            
    }
    
    var title : some View{
        ZStack{
            Rectangle()
                .foregroundColor(.white)
            HStack{
                Text("Peralatanmu")
                    .foregroundColor(Color("myGreen"))
                    .bold()
                    .font(.system(size: 28))
                Spacer()
            }.padding()
        }
    }
    
    var toolsList : some View{
        ZStack{
            Rectangle()
                .foregroundColor(.white)
            VStack{
                if !garden.currentGarden.listTools.isEmpty{
                    ForEach((0...garden.currentGarden.listTools.count-1),id: \.self){i in
                        HStack{
                            VStack (alignment:.leading,spacing: 8){
                                Text(garden.currentGarden.listTools[i].name)
                                    .fontWeight(.regular).font(.system(size: 17))
                                if !garden.currentGarden.listTools[i].desc.isEmpty{
                                    Button("Lihat"){
                                        sheetManager.whichTools = garden.currentGarden.listTools[i]
                                        sheetManager.showSheet.toggle()
                                    }.foregroundColor(Color("myGreen"))
                                }
                            }
                                
                            Spacer()
                            Text("\(garden.currentGarden.listTools[i].num) Buah")
                                .foregroundColor(Color("myDarkGray")).fontWeight(.regular).font(.system(size: 15))
                            if garden.currentGarden.listTools[i].checklist{
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color("myGreen"))
                                    
                            }else{
                                Image(systemName: "circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color("myGreen"))
                            }
                        }.padding()
                            .onTapGesture {
                                var garden2 = UserDefaultService.shared.currentGarden
                                garden2.listTools[i].checklist.toggle()
                                garden.currentGarden.listTools = garden2.listTools
                                UserDefaultService.shared.saveToUDwithName(garden: garden2)
                            }
                        Divider()
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

struct PlanChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        PlanChecklistView( garden: UserDefaultService())
    }
}
extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
            .resizable()
            .scaledToFill()
            .frame(width: geo.size.width, height: geo.size.height)
            .clipped()
        }
    }
}
