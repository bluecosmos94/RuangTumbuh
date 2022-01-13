//
//  MethodeReferenceView.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 07/12/21.
//

import SwiftUI

struct MethodeReferenceView: View {
    @State var methodes: [MethodeDetailItem] = MethodeDummy.data
    @EnvironmentObject var appdata: AppData
    
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("myGray"))
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        if methodes.count > 0{
                            ForEach((0...methodes.count - 1), id:\.self){i in
                               MethodeAvailableView(methode: methodes[i])
                                    .onTapGesture {
                                        let view = MethodeReferenceDetailView(method: methodes[i]).environmentObject(appdata)
                                        let vc = UIHostingController(rootView: view)
                                        appdata.navigation?.show(vc, sender: nil)
                                    }
                                Divider()
                            }
                        }
                    }.background(Color.white).padding()
                    
                }
                
            }
            .onAppear(perform: {
                appdata.navigation?.navigationBar.isHidden = true
            })
            
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Referensi Methode")
            .navigationBarItems(leading:
                                    Button(action: {
                appdata.navigation?.popViewController(animated: true)
            }, label: {
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color("myYellow"))
                    Text("Dashboard")
                        .foregroundColor(Color("myYellow"))
                }
            })
            )
        }
    }
}

struct MethodeReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        MethodeReferenceView()
    }
}
