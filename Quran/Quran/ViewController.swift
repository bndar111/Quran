//
//  ViewController.swift
//  Quran
//
//  Created by بندر عبيد ثاري الرشيدي on 26/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    var ruselt = Quran()
    var soar : [Sorah] = []
    let session = URLSession.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
        print(soar)
    }
    
    // سحب معلومات
    func fetchData(){
        // https://api.quran.com/api/v4/chapters?language=en
//        var ulrComponents = URLComponents()
//        ulrComponents.scheme = "https"
//        ulrComponents.host = "api.quran.com"
//        ulrComponents.path = "/api/v4/chapters"
//        let language = URLQueryItem(name: "language", value: "en")
//        ulrComponents.queryItems = [language]
//
//        let request = URLRequest(url: ulrComponents.url!)
        //        print(request)
        let url = "https://api.quran.com/api/v4/chapters?language=en"
        let request = URLRequest(url: URL(string: url)!)
        //        session.dataTask(with: request as URLRequest) { (data, res, err) in
        let task = session.dataTask(with: request as URLRequest) { (data: Data?, res: URLResponse?, err: Error?) in
            
            do {
                let jsonDecoder = JSONDecoder()
                let decodedRes = try jsonDecoder.decode(Quran.self, from: data!)
                self.ruselt = decodedRes
                print(decodedRes)
                
                for s in self.ruselt.chapters {
                    self.soar.append(s)
                }
            } catch {
                print(err?.localizedDescription)
            }
        }
        task.resume()
    }
    
}


