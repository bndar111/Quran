//
//  AyatVC.swift
//  Quran
//
//  Created by Abdullah Bajaman on 04/12/2021.
//

import UIKit

class AyatVC: UIViewController {

    var api : API = API()
    var ayat : [Ayah] = []
    var query : [String: String] = [:]
    var sorahNum = "1"

    @IBOutlet weak var contentLbl: UILabel!
   
    
    @IBOutlet var pageNum : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        api.fetchAyat(sorahNum, "", "", "", "", "")
//        api.fetchAyat()
//        getAyat()
//        print(sorahNum)

        fetchQuery(q: query)
        contentLbl.text = "Loading Ayat AlQuran"
        pageNum.text = sorahNum
    }
    func getAyat(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            let str = self.api.ayat.map{"\($0.text_uthmani_simple) ⦕\($0.verse_key.split(separator: ":").last!)⦖ "}
            self.contentLbl.text = str.joined()
            print("ayat number: \(self.api.ayat.count)")
            
        }
        
    }
    func fetchQuery(q: [String:String]){
        switch q.keys.first {
        case "Chapter Number":
            api.fetchAyat(q.values.first!, "", "", "", "", "")
        case "Juz Number":
            api.fetchAyat("", q.values.first!, "", "", "", "")
        case "Page Number":
            api.fetchAyat("", "", q.values.first!, "", "", "")
        case "Hizb Number":
            api.fetchAyat("", "", "", "", q.values.first!, "")
        case "Rub Number":
            api.fetchAyat("", "", "", "", "", q.values.first!)
        default:
            api.fetchAyat(sorahNum, "", "", "", "", "")
        }
        getAyat()
    }
    // MARK: save Al Quran in CoreData
    // add function to store data in Core Data
    // create view controller

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
