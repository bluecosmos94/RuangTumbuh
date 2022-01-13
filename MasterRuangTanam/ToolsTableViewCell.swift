//
//  ToolsTableViewCell.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 23/11/21.
//

import UIKit

class ToolsTableViewCell: UITableViewCell {

    @IBOutlet weak var mdTable: UITableView!
    
    var tools : [ToolsDetail] = [
        ToolsDetail(name: "Hidroponik Rak KIT Gully Trapesium NFT 1 Meter (4 Gully)", image: "methods-nft-3dkit", desc: """
Starterkit NFT 40 lubang tanam yang sudah siap pakai.
Rangka terbuat dari pipa paralon tebal 3 mm yang dirangkai
 menjadi 4 gully dengan masing-masing gully 10 lubang tanam.
rangkaian ini dihubungkan dengan kontainer air dan pompa air
untuk mengalirkan air ke sistem
""", function: """
Fungsi NFT kit ini adalah sebagai media tanam setelah proses
pengecambahan selesai.
"""), ToolsDetail(name: "Container", image: "methods-nft-container", desc: """
kontainer ini dapat berupa wadah apa saja yang dapat
menampung rockwoll yang berisi benih yang sedang disemai.
""", function: """
Fungsi kontainer ini adalah sebagai wadah penyemaian yang
menampung balok-balok rockwoll berisi benih.
"""), ToolsDetail(name: "Suntikan 10 mL", image: "methods-nft-suntikan", desc: """
Pompa piston sederhana untuk menyuntikkan atau menghisap
cairan atau gas. Alat suntik terdiri dari tabung dengan piston di
dalamnya
""", function: """
Fungsi spuit atau suntikan 10 mL ini adalah untuk
menginjeksikan pupuk cair kedalam sistem irigasi hidroponik
"""), ToolsDetail(name: "NetPot", image: "methods-nft-netpot", desc: """
Pot berpori dengan ukuran standart diameter 4 cm. Pot ini pada
operasionalnya dilengkapi dengan kain flanel yang berfungsi
sebagai penyerap air dari sistem irigasi hidroponik
""", function: """
Fungsi netpot adalah sebagai wadah rockwoll pada sistem
hidroponik. atau bisa juga disetut sebagai pot hidroponik.
"""),ToolsDetail(name: "TDS Meter", image: "methods-nft-TDSmeter", desc: """
TDS adalah singkatan dari Total Dissolved Solid yang bahasa
indonesianya berarti “jumlah total padatan terlarut”, jadi
TDS meter adalah alat pengukur jumlah padatan atau partikel
yang terlarut pada air dalam satuan ppm ( part per million )
atau mg/L.
""", function: """
Fungsi TDS meter adalah untuk mengukur nutrisi (padatan
terlarut) pada sistem hidroponik.
"""),ToolsDetail(name: "PH Meter", image: "methods-nft-PHmeter", desc: """
pH meter adalah sebuah alat elektronik  terdiri dari sebuah
elektrode (probe pengukur) yang berfungsi untuk mengukur
pH (derajat keasaman atau kebasaan) suatu cairan (ada
elektrode khusus yang berfungsi untuk mengukur pH
bahan-bahan semi-padat).
""", function: """
Fungsi pH meter adalah untuk mengukur tingkat keasaman
air pada sistem irigasi hidroponik.
"""),ToolsDetail(name: "Lampu LED", image: "methods-nft-LED", desc: """
Lampu LED adalah produk diode pancaran cahaya (LED)
yang disusun menjadi sebuah lampu. Lampu LED memiliki
usia pakai dan efisiensi listrik beberapa kali lipat lebih balik
daripada lampu pijar
""", function: """
Fungsi Lampu LED ini adalah untuk memenuhi kebutuhan
cahaya pada sistem hidroponik.
""")
]
    
    var action : (()->())!
    var selectedTool = ToolsDetail()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mdTable.dataSource = self
        mdTable.delegate = self
        
        let nib = UINib(nibName: "ToolsViewCell", bundle: nil)
        mdTable.register(nib, forCellReuseIdentifier: "toolCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
        // Configure the view for the selected state
    }
    func lookDetail(tool : ToolsDetail){
        selectedTool = tool
        action()
    }
}

extension ToolsTableViewCell : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return mdTable.frame.height / CGFloat(tools.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mdTable.deselectRow(at: indexPath, animated: true)
    }
    
}
extension ToolsTableViewCell : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mdTable.dequeueReusableCell(withIdentifier: "toolCell") as! ToolsViewCell
        cell.nameText.text = tools[indexPath.row].name
        cell.action = { self.lookDetail(tool: self.tools[indexPath.row]) }
        return cell
    }
    
    
}
