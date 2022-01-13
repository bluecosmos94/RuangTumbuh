//
//  DataDummy.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 07/12/21.
//

import Foundation


struct PlantDummy{
    static let data : [PlantDetailItem] = [
        PlantDetailItem(name: "Bok-Choy", masaTanam: "Masa tanam 35 – 45 hari.", masaTanamDetail: """
- Masa tanam 35 – 45 hari.
- Pembibitan  3 - 5 hari
- Persemaian setelah 2-7 helai daun
- Panen 21 - 25 hari (setelah tanam)  
""", saranKonsumsi: """
- Dikonsumsi langsung
- Dikukus
- Ditumis
- Dipanggang.                                                                    
"""
, image: "Bok-Choy"
, footcandle: 60.0),
        PlantDetailItem(name: "Butterhead Lettuce", masaTanam: "Masa tanam 50 - 70 hari.", masaTanamDetail: """
- Masa tanam 50 - 70 hari.
- Pembibitan  3 - 5 hari
- Persemaian setelah 3 - 7 helai daun
- Panen 60 - 70 hari ( setelah tanam)
"""
                        , saranKonsumsi: """
                                    - Dikonsumsi langsung
                                    - Ditumis.
                                    - dijadikan salad
                                    - Direbus atau dikukus
""", image: "Butterhead Lettuce", footcandle: 60.0),
        PlantDetailItem(name: "Green Lettuce", masaTanam: "Masa tanam 30 – 45 hari.", masaTanamDetail: """
- Masa tanam 30 – 45 hari.
- Pembibitan  3 - 5 hari
- Persemaian setelah 2-7 helai daun
- Panen 35 - 45 hari ( setelah tanam)                                                                         
""", saranKonsumsi: """
- Dikonsumsi langsung
- Dikukus
- Ditumis
- Dipanggang.                                                                    
"""
, image: "Green Lettuce"
, footcandle: 60.0),
PlantDetailItem(name: "Romaine Lettuce", masaTanam: "Masa tanam 30 – 45 hari.", masaTanamDetail: """
- Masa tanam 30 – 45 hari.
- Pembibitan  3 - 5 hari
- Persemaian setelah 2-7 helai daun
- Panen 35 - 45 hari ( setelah tanam)                                                                         
""", saranKonsumsi: """
- Dikonsumsi langsung
- Dikukus
- Ditumis
- Dipanggang.                                                                    
"""
, image: "Romaine Lettuce"
, footcandle: 60.0),
        PlantDetailItem(name: "Tomat cherry", masaTanam: "Masa tanam 50 – 90  hari.", masaTanamDetail: """
- Masa tanam 50 – 90  hari.
- Pembibitan  3 - 5 hari
- Persemaian setelah 3 - 4  helai daun
- Panen 60 - 90   hari ( setelah tanam)                                                                          
""", saranKonsumsi: """
- Dikonsumsi langsung
- Dikukus
- Ditumis
- Dipanggang
- Dijadikan Salad
- menjadi bahan dasar untuk pembuatan sauce.                                                                           
"""
        , image: "Tomat cherry"
        , footcandle: 120),
    ]
}


struct MethodeDummy{
    
    static let data : [MethodeDetailItem] = [
        MethodeDetailItem(name: "NFT Hidroponik", desc: "", priceRange: "Rp. 600.000 - Rp. 3.000.000 ", level: "Menengah", levelDesc: "Salah satu kesulitan dari metode ini adalah benyaknya peralatan yang dibutuhkan untuk melakukan otomasi dan menjalankan pompa air.\nKetika peralatan lengkap dan pemasangan benar, perawatan dari metode ini sangat sedikit.", positiv: "Pemeliharaan lebih mudah.\nTanaman tumbuh lebih cepat dan maksimal.\nTak banyak menghabiskan pupuk.\nRisiko pengendapan kotoran dalam gully/talang sedikit.", negative: "Tergantung pada listrik.\nPenyebaran penyakit cepat.\nBiaya instalasi mahal.", tools: [
            ToolsItem(name: "Hidroponik Rak KIT Gully Trapesium NFT 1 Meter (4 Gully)",desc: """
Starterkit NFT 40 lubang tanam yang sudah siap pakai.
Rangka terbuat dari pipa paralon tebal 3 mm yang dirangkai
 menjadi 4 gully dengan masing-masing gully 10 lubang tanam.
rangkaian ini dihubungkan dengan kontainer air dan pompa air
untuk mengalirkan air ke sistem
""",function: """
Fungsi NFT kit ini adalah sebagai media tanam setelah proses
pengecambahan selesai.
"""),ToolsItem(name: "Netpot", desc: """
Pot berpori dengan ukuran standart diameter 4 cm. Pot ini pada
operasionalnya dilengkapi dengan kain flanel yang berfungsi
sebagai penyerap air dari sistem irigasi hidroponik
""",function: """
Fungsi netpot adalah sebagai wadah rockwoll pada sistem
hidroponik. atau bisa juga disetut sebagai pot hidroponik.
"""),
            ToolsItem(name: "Container",num:4,desc: """
kontainer ini dapat berupa wadah apa saja yang dapat
menampung rockwoll yang berisi benih yang sedang disemai.
Fungsi kontainer ini adalah sebagai wadah penyemaian yang
menampung balok-balok rockwoll berisi benih.
"""),
            ToolsItem(name: "Suntikan 10 ml",num:1, desc: """
Pompa piston sederhana untuk menyuntikkan atau menghisap
cairan atau gas. Alat suntik terdiri dari tabung dengan piston di
dalamnya.
Fungsi spuit atau suntikan 10 mL ini adalah untuk
menginjeksikan pupuk cair kedalam sistem irigasi hidroponik
"""),
            ToolsItem(name: "TDS Meter",num:1,desc: """
TDS adalah singkatan dari Total Dissolved Solid yang bahasa
indonesianya berarti “jumlah total padatan terlarut”, jadi
TDS meter adalah alat pengukur jumlah padatan atau partikel
yang terlarut pada air dalam satuan ppm ( part per million )
atau mg/L.
Fungsi TDS meter adalah untuk mengukur nutrisi (padatan
terlarut) pada sistem hidroponik.
"""),
            ToolsItem(name: "PH Meter",num:1,desc: """
pH meter adalah sebuah alat elektronik  terdiri dari sebuah
elektrode (probe pengukur) yang berfungsi untuk mengukur
pH (derajat keasaman atau kebasaan) suatu cairan (ada
elektrode khusus yang berfungsi untuk mengukur pH
bahan-bahan semi-padat).
Fungsi pH meter adalah untuk mengukur tingkat keasaman
air pada sistem irigasi hidroponik.
"""),
        ], open: false),
        
        MethodeDetailItem(name: "Wick Hidroponik", desc: "", priceRange: "Rp. 50.000 - Rp. 500.000 ", level: "Mudah", levelDesc: "Wick system adalah sistem hidroponik yang paling sederhana dan mudah dilakukan.\nMetode ini membutuhkan lahan kurang dari 1 meter. ", positiv: "Tanaman dapat mendapat suplai air dan nutrisi secara terus menerus.\nBiaya pembuatan yang murah.\nMempermudah perawatan tanaman karena tidak perlu melakukan penyiraman.\nTidak tergantung listrik", negative: "Air dan nutrisi yang diberikan tidak dapat kembali ke bak penampungan sehingga lebih boros.\nBanyaknya jumlah air yang diberikan akan sedikit susah diatur", tools: [
            ToolsItem(name: "Wick Hidroponik Set",desc: """
Wick hidroponik set berisi 9 lubang tanam pada tiap kontainer,
dilengkapi dengan 9 netpot yang terhubung dengan kain
flanel sebagai media penyerap nutrisi dari cairan didalam kontainer.
""",function: """
Fungsi NFT kit ini adalah sebagai media tanam setelah proses
pengecambahan selesai.
"""),ToolsItem(name: "Netpot", desc: """
Pot berpori dengan ukuran standart diameter 4 cm. Pot ini pada
operasionalnya dilengkapi dengan kain flanel yang berfungsi
sebagai penyerap air dari sistem irigasi hidroponik
""",function: """
Fungsi netpot adalah sebagai wadah rockwoll pada sistem
hidroponik. atau bisa juga disetut sebagai pot hidroponik.
"""),
            ToolsItem(name: "Container",num:4,desc: """
kontainer ini dapat berupa wadah apa saja yang dapat
menampung rockwoll yang berisi benih yang sedang disemai.
""",function: """
Fungsi kontainer ini adalah sebagai wadah penyemaian yang
menampung balok-balok rockwoll berisi benih.
"""),
            ToolsItem(name: "Suntikan 10 ml",num:1, desc: """
Pompa piston sederhana untuk menyuntikkan atau menghisap
cairan atau gas. Alat suntik terdiri dari tabung dengan piston di
dalamnya
""",function: """
Fungsi spuit atau suntikan 10 mL ini adalah untuk
menginjeksikan pupuk cair kedalam sistem irigasi hidroponik
"""),
            ToolsItem(name: "TDS Meter",num:1,desc: """
TDS adalah singkatan dari Total Dissolved Solid yang bahasa
indonesianya berarti “jumlah total padatan terlarut”, jadi
TDS meter adalah alat pengukur jumlah padatan atau partikel
yang terlarut pada air dalam satuan ppm ( part per million )
atau mg/L.
""",function: """
Fungsi TDS meter adalah untuk mengukur nutrisi (padatan
terlarut) pada sistem hidroponik.
"""),
            ToolsItem(name: "PH Meter",num:1,desc: """
pH meter adalah sebuah alat elektronik  terdiri dari sebuah
elektrode (probe pengukur) yang berfungsi untuk mengukur
pH (derajat keasaman atau kebasaan) suatu cairan (ada
elektrode khusus yang berfungsi untuk mengukur pH
bahan-bahan semi-padat).
""",function: """
Fungsi pH meter adalah untuk mengukur tingkat keasaman
air pada sistem irigasi hidroponik.
"""),
        ], open: false),
        MethodeDetailItem(name: "Water Culture", desc: "", priceRange: "Rp. 50.000 - Rp. 300.000 ", level: "Mudah", levelDesc: "Water culture system adalah sistem Hidroponik yang sederhana dan mudah dilakukan. Metode ini dapat digunakan dari sekala kecal kurang dari 1 meter sampai sekala besar. ", positiv: "Biaya pembuatan yang murah dikarenakan tidak memerlukan alat yang menunjang sistem hidroponik mengalami keberlangsungan.\nBahan yang diperlukan untuk pembuatan mudah dicari dari lingkungan sekitar.\nPerawatannya tidak merepotkan.\nTidak bergantung pada kondisi kestabilan berikut ketersediaan listrik, sehingga Anda bisa lebih hemat pengeluaran.\nLebih hemat air dan nutrisi.", negative: "Rancangan hidroponik tanaman dengan sistem rakit apung lebih cocok dilakukan di dalam ruangan, bukan ditempatkan di luar ruangan.\nAkar tanaman lebih rentan mengalami pembusukan karena terus tergenang dalam air larutan nutrisi.\nKadar oksigen yang sedikit, meskipun sada sebagian akar tanaman yang tidak terendam dalam larutan nutrisi sehingga memungkinkan oksigen datang untuk membantu proses fotosintesis.", tools: [
            ToolsItem(name: "Water Culture Hidroponik Set",desc: """
Water culture set terdiri dari 9 lubang tanam. yang dilengkapi dengan
saluran pompa untuk mengalirkan udara yang berfungsi
menratakan kandungan nutrisi pada kontainer hidroponik.
""",function: """
Fungsi NFT kit ini adalah sebagai media tanam setelah proses
pengecambahan selesai.
"""), ToolsItem(name: "Container",num:4,desc: """
kontainer ini dapat berupa wadah apa saja yang dapat
menampung rockwoll yang berisi benih yang sedang disemai.
""",function: """
Fungsi kontainer ini adalah sebagai wadah penyemaian yang
menampung balok-balok rockwoll berisi benih.
"""),
            ToolsItem(name: "Suntikan 10 ml",num:1, desc: """
Pompa piston sederhana untuk menyuntikkan atau menghisap
cairan atau gas. Alat suntik terdiri dari tabung dengan piston di
dalamnya
""",function: """
Fungsi spuit atau suntikan 10 mL ini adalah untuk
menginjeksikan pupuk cair kedalam sistem irigasi hidroponik
"""),
            ToolsItem(name: "TDS Meter",num:1,desc: """
TDS adalah singkatan dari Total Dissolved Solid yang bahasa
indonesianya berarti “jumlah total padatan terlarut”, jadi
TDS meter adalah alat pengukur jumlah padatan atau partikel
yang terlarut pada air dalam satuan ppm ( part per million )
atau mg/L.
""",function: """
Fungsi TDS meter adalah untuk mengukur nutrisi (padatan
terlarut) pada sistem hidroponik.
"""),
            ToolsItem(name: "PH Meter",num:1,desc: """
pH meter adalah sebuah alat elektronik  terdiri dari sebuah
elektrode (probe pengukur) yang berfungsi untuk mengukur
pH (derajat keasaman atau kebasaan) suatu cairan (ada
elektrode khusus yang berfungsi untuk mengukur pH
bahan-bahan semi-padat).
""",function: """
Fungsi pH meter adalah untuk mengukur tingkat keasaman
air pada sistem irigasi hidroponik.
"""),
        ], open: false),
    ]
}
