//
//  ToolsDetail.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 17/11/21.
//

import SwiftUI

struct ToolsDetailView: View {
    
    @State var tools  : ToolsItem = ToolsItem()
    @State var canBuy : Bool = false
    @State var showAlert : Bool = false
    var body: some View {
        VStack{
            
            Image(tools.name)
                .resizable()
                .frame(width: 244, height: 239, alignment: .center)
            
            Divider()
            Text(tools.name)
                .foregroundColor(Color("myGreen"))
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.top,20)
            Text(tools.desc)
                .font(.system(size: 17))
                .multilineTextAlignment(.leading)
            if canBuy{
                CustomButtonView(title: "Beli") {
                    searchOnTokopedia()
//                    showAlert.toggle()
                }
            }
        }.padding().alert(isPresented: $showAlert) {
            Alert(title: Text("Coming Soon"), message: Text("This is the upcoming feature. please wait until our shops are ready!"))
        }
        
    }
    
    func searchOnTokopedia(){
        let application = UIApplication.shared
        let path = "tokopedia://search?q=" + generateKeyworkd()
        let webPath = "https://www.tokopedia.com/search?q=" + generateKeyworkd()
        let url = URL(string: path)!
        let website = URL(string: webPath)!
        if application.canOpenURL(url){
            application.open(url, options: [:], completionHandler: nil)
        }else{
            application.open(website, options: [:], completionHandler: nil)
        }
    }
    
    func generateKeyworkd()->String{
        return tools.name.replacingOccurrences(of: " ", with: "%20")
    }
}

struct ToolsDetail_Previews: PreviewProvider {
    static var previews: some View {
        ToolsDetailView()
    }
}


struct ToolsDetail{
    var name : String = """
    Hidroponik Rak KIT Gully
    Trapesium NFT 1 Meter (4 Gully)
"""
    var image : String = ""
    var desc : String = """
Starterkit NFT 40 lubang tanam yang sudah siap pakai.
Rangka terbuat dari pipa paralon tebal 3 mm yang dirangkai menjadi 4 gully dengan masing-masing gully 10 lubang tanam.
rangkaian ini dihubungkan dengan kontainer air dan pompa air untuk mengalirkan air ke sistem
"""
    var function : String = """
    Fungsi NFT kit ini adalah sebagai media tanam setelah proses pengecambahan selesai.
    """
}
