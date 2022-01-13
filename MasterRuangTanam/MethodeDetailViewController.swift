//
//  MethodeDetailViewController.swift
//  MasterRuangTanam
//
//  Created by angga saputra on 23/11/21.
//

import UIKit
import SwiftUI



class MethodeDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data : [MethodeDetailItem] = [
        MethodeDetailItem(name: "Tingkat Operasional", desc: "Mudah"),
        MethodeDetailItem(name: "Kebutuhan lahan", desc: "Lahan yang dibutuhkan untuk metode NFT minimal memiliki luas 1 meter persegi ditambah space 0,5 meter sebagai area interaksi user dengan media. Tiap 1m x 1m dapat menghasilkan 40 lubang tanam."),
        MethodeDetailItem(name: "Deskripsi", desc: "Konsep dasar NFT ini adalah suatu metode budidaya tanaman dengan akar tanaman tumbuh pada lapisan nutrisi yang dangkal dan tersirkulasi sehingga nutrisi terpenuhi."),
        MethodeDetailItem(name: "Kelebihan", desc: """
\u{2022} Pemeliharaan lebih mudah
\u{2022} Tanaman tumbuh cepat dan maksimal
\u{2022} Tak banyak menghabiskan pupuk
\u{2022} Resiko pengendapan kotoran minim 
"""),
        MethodeDetailItem(name: "Kekurangan", desc: """
\u{2022} Tergantung pada listik
\u{2022} Penyakit tanaman cepat menyebar
\u{2022} Biaya instalasi mahal
"""),
        MethodeDetailItem(name: "Perkiraan Harga", desc: """
        Rp.1.600.000 - Rp.3.000.000
"""),
        MethodeDetailItem(name: "Peralatan"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        // Do any additional setup after loading the view.
        setupTable()
    }
    
    func setupTable(){
        tableView.register(UINib(nibName: "MDImageTableViewCell", bundle: nil), forCellReuseIdentifier: "mdImage")
        tableView.register(UINib(nibName: "MDStatusTableViewCell", bundle: nil), forCellReuseIdentifier: "mdStatus")
        tableView.register(UINib(nibName: "MDDescTableViewCell", bundle: nil), forCellReuseIdentifier: "mdDesc")
        tableView.register(UINib(nibName: "ToolsTableViewCell", bundle: nil), forCellReuseIdentifier: "mdTools")
    }
    
    func lookDetail(tool : ToolsDetail){
//        let vc = UIHostingController(rootView: ToolsDetailView(tools: tool))
//        vc.modalPresentationStyle = .formSheet
//        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func choseMethode(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ChooseMethode", bundle: nil)
        //MeasureDone
        let viewController = storyboard.instantiateViewController(withIdentifier: "addModel")
        self.navigationController?.show(viewController, sender: nil)
    }

    

}
extension MethodeDetailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0{
            data[indexPath.row-1].open.toggle()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        
        switch index {
        case 0:
            return 300
        case 1:
            if self.data[0].open{
                return 120
            }else{
                return 72
            }
        case 2:
            if self.data[1].open{
                return 200
            }else{
                return 72
            }
        case 3:
            if self.data[2].open{
                return 200
            }else{
                return 72
            }
        case 4:
            if self.data[3].open{
                return 200
            }else{
                return 72
            }
        case 5:
            if self.data[4].open{
                return 200
            }else{
                return 72
            }
        case 6:
            if self.data[5].open{
                return 120
            }else{
                return 72
            }
        case 7:
            if self.data[6].open{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdTools") as? ToolsTableViewCell
                
                return CGFloat(72 * CGFloat(cel1?.tools.count ?? 1) )
            }else{
                return 72
            }
        
        default:
            return 100
        }
        
    }
}

extension MethodeDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cel1 = self.tableView.dequeueReusableCell(withIdentifier: "mdImage") as? MDImageTableViewCell
            return cel1!
            
        case 1:
            if data[indexPath.row-1].open{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdDesc") as? MDDescTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }else{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdStatus") as? MDStatusTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
                
            }
        case 2:
            if data[indexPath.row-1].open{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdDesc") as? MDDescTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }else{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdStatus") as? MDStatusTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }
        case 3:
            if data[indexPath.row-1].open{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdDesc") as? MDDescTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }else{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdStatus") as? MDStatusTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }
        case 4:
            if data[indexPath.row-1].open{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdDesc") as? MDDescTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }else{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdStatus") as? MDStatusTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }
        case 5:
            if data[indexPath.row-1].open{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdDesc") as? MDDescTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }else{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdStatus") as? MDStatusTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }
        case 6:
            if data[indexPath.row-1].open{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdDesc") as? MDDescTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }else{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdStatus") as? MDStatusTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }
        case 7:
            if data[indexPath.row-1].open{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdTools") as? ToolsTableViewCell
                cel1?.action = { self.lookDetail(tool: cel1?.selectedTool ?? ToolsDetail())}
//                cel1?.methode = data[indexPath.row-1]
//                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }else{
                let cel1 = tableView.dequeueReusableCell(withIdentifier: "mdStatus") as? MDStatusTableViewCell
                cel1?.methode = data[indexPath.row-1]
                cel1?.updateUI()
                return cel1 ?? UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }
    
    
}
