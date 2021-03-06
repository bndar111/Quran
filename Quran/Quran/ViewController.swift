//
//  ViewController.swift
//  Quran
//
//  Created by بندر عبيد ثاري الرشيدي on 26/04/1443 AH.
//

import UIKit


class ViewController: UIViewController , UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soar.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuranS", for: indexPath) as! TableCell
        cell.id.text = String(soar[indexPath.row].id)
        cell.name_arabic.text = soar[indexPath.row].name_arabic
        cell.revelation_place.text = soar[indexPath.row].revelation_place
        cell.verses_count.text = String(soar[indexPath.row].verses_count)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ayatVC = storyboard?.instantiateViewController(withIdentifier: "ayatID") as! AyatVC
        ayatVC.sorahNum = String(soar[indexPath.row].id)

        print("Sorah number \(String(soar[indexPath.row].id)) is selecte")
        
        self.navigationController?.show(ayatVC, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    @IBOutlet weak var tableView: UITableView!
    var reuslt = Quran()
    var soar : [Sorah] = []
    let session = URLSession.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchList()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //   رابط سحب معلومات
    func fetchList(){
        // https://api.quran.com/api/v4/chapters?language=en
        var ulrComponents = URLComponents()
        ulrComponents.scheme = "https"
        ulrComponents.host = "api.quran.com"
        ulrComponents.path = "/api/v4/chapters"
        //على حسب الاحتياج.../
        let language = URLQueryItem(name: "language", value: "en")
        ulrComponents.queryItems = [language]
        // الى هنا.../
        let request = URLRequest(url: ulrComponents.url!)
        print(request)
        //        let url = "https://api.quran.com/api/v4/chapters?language=en"
        //        let request = URLRequest(url: URL(string: url)!)
        session.dataTask(with: request) { (data, res, err) in
            
            
            do {
                let jsonDecoder = JSONDecoder()
                let decodedRes = try jsonDecoder.decode(Quran.self, from: data!)
                
                self.reuslt = decodedRes
                print(decodedRes)
                
                for s in self.reuslt.chapters {
                    self.soar.append(s)
                    print(s)
                    
                }
            } catch {
                print(err?.localizedDescription)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                
                self.tableView.reloadData()
            }
        }.resume()
        
    }
}
    class TableCell : UITableViewCell {
        
        @IBOutlet weak var id: UILabel!
        
        @IBOutlet weak var revelation_place: UILabel!
        @IBOutlet weak var name_arabic: UILabel!
        
        
        @IBOutlet weak var verses_count: UILabel!
    }
