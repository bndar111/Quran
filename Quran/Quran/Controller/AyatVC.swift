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
//    var ayat : [String] = []
    @IBOutlet weak var contentLbl: UILabel!
   
    
    @IBOutlet weak var pageNumLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        api.fetchAyat("67", "", "", "", "", "")
        getAyat()
        
//        view.layer.borderWidth = 2
//        view.layer.borderColor = UIColor.red.cgColor
        contentLbl.text = "Loading Ayat AlQuran"
    }
    func getAyat(){
//        defer {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//
////                self.contentLbl.text = self.ayat.joined(separator: "(*)")
//            }
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        
            for ayah in self.api.ayat{
//                self.ayat.append(ayah.text_uthmani_simple)
                self.ayat.append(ayah)
                print(ayah.text_uthmani_simple + ayah.verse_key.split(separator: ":").last!)
            }
            let str = self.ayat.map{"\($0.text_uthmani_simple) ⦕\($0.verse_key.split(separator: ":").last!)⦖ "}
            
            self.contentLbl.text = str.joined()

//            print(self.ayat[0...6])

                
            
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//@IBDesignable extension UIView {
//    @IBInspectable var borderColor: UIColor? {
//        get {
//            guard let cgColor = layer.borderColor else {
//                return nil
//            }
//            return UIColor(cgColor: cgColor)
//        }
//        set { layer.borderColor = newValue?.cgColor }
//    }
//
//    @IBInspectable var borderWidth: CGFloat {
//        get {
//            return layer.borderWidth
//        }
//        set {
//            layer.borderWidth = newValue
//        }
//    }
//}
