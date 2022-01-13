//
//  GardenNameView.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 27/11/21.
//

import SwiftUI
import Combine

struct GardenNameView: View {
    

    @EnvironmentObject var appdata : AppData
    
    @State var namaKebun : String = ""
    @State var isSheet = false
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Image("gardenName")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.screenWidth * 0.8,height: UIScreen.screenHeight/4)
                    .clipped()
                Text("Berikan Nama untuk Kebunmu")
                    .foregroundColor(Color("myGreen"))
                    .bold()
                    .font(.system(size: 20))
                    .padding(.bottom)
                TextField("Nama Kebun", text: $namaKebun).modifier(ClearButton(text: $namaKebun))
                    .onReceive(Just(namaKebun)) { _ in limitText(25) }
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(12)
                    .background(Color.white)
                    .padding(.bottom)
                CustomButtonView(title: "Oke") {
                    if namaKebun.isEmpty{
                        return
                    }
                    let gar = GardenModel(name:namaKebun)
                    UserDefaultService.shared.saveNewGarden(garden: gar)
                    appdata.navigation?.popToRootViewController(animated: true)
                }
                Spacer()
                Spacer()
            }
            .sheet(isPresented: $isSheet){
                NameDoneView(gardenName: $namaKebun, isSheet: $isSheet)
            }
            .onTapGesture {
                hideKeyboard()
            }
            .background(Color("myGray"))
            .ignoresSafeArea()
                
        }.background(Color("myGray")).navigationViewStyle(StackNavigationViewStyle())
 
    }
    
    //Function to keep text length in limits
        func limitText(_ upper: Int) {
            if namaKebun.count > upper {
                namaKebun = String(namaKebun.prefix(upper))
            }
        }
}

struct GardenNameView_Previews: PreviewProvider {
    static var previews: some View {
        GardenNameView()
    }
}

struct ClearButton: ViewModifier
{
    @Binding var text: String

    public func body(content: Content) -> some View
    {
        ZStack(alignment: .trailing)
        {
            content

            if !text.isEmpty
            {
                Button(action:
                {
                    self.text = ""
                })
                {
                    Image(systemName: "delete.left.fill")
                        .foregroundColor(Color("myGreen"))
                }
                .padding(.trailing, 8)
            }
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
