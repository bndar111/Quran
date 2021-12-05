//
//  Api.swift
//  Quran
//
//  Created by بندر عبيد ثاري الرشيدي on 26/04/1443 AH.
//

import Foundation

class Quran : Codable {
    var chapters : [Sorah] = []
}

struct Sorah : Codable{
    var id : Int
    var revelation_place : String?
    var name_arabic : String
    var verses_count : Int
}


// MARK: Get Uthmani simple script of ayah
/* https://api.quran.com/api/v4/quran/verses/uthmani_simple */
/*
 {
   "verses": [
     {
       "id": 8,
       "verse_key": "2:1",
       "text_uthmani_simple": "الم"
     }
   ]
 }
 */
class DataResponce : Codable {
    var verses : [Ayah]
}
struct Ayah : Codable{
    let id: Int
    let verse_key: String
    let text_uthmani_simple: String
}

class API {
    var urlComponents = URLComponents()
    let session = URLSession.shared
    
    var result : DataResponce!
    var ayat : [Ayah] = []
    
    
    func fetchAyat(_ chapterNum: String = "",
                   _ juzNum: String = "",
                   _ pageNum: String = "",
                   _ hizbNum: String = "",
                   _ rubNum: String = "",
                   _ verseKey: String = ""){
          
        urlComponents.scheme = "https"
        urlComponents.host = "api.quran.com"
        urlComponents.path = "/api/v4/quran/verses/uthmani_simple"
        
        // queyries
        var queryArray : [URLQueryItem] = []
        
            let chapter = URLQueryItem(name: "chapter_number", value: chapterNum)// soray
            let juz = URLQueryItem(name: "juz_number", value: juzNum)
            let page = URLQueryItem(name: "page_number", value: pageNum)
            let hizb = URLQueryItem(name: "hizb_number", value: hizbNum)
            let rub = URLQueryItem(name: "rub_number", value: rubNum)
            let ayah = URLQueryItem(name: "verse_key", value: verseKey)// Sorah number : Ayah number (1:1)
        
        if chapterNum != "" {
            queryArray.append(chapter)
        }else if juzNum != "" {
            queryArray.append(juz)
        }else if pageNum != "" {
            queryArray.append(page)
        }else if hizbNum != ""{
            queryArray.append(hizb)
        }else if rubNum != "" {
            queryArray.append(rub)
        }else if verseKey != "" {
            queryArray.append(ayah)
        }else {
            print("No Query")
        }
        
        urlComponents.queryItems = queryArray
        let request = URLRequest(url: urlComponents.url!)
        print(request)
        session.dataTask(with: request, completionHandler: handler(data:respone:error:)).resume()
    }
    func handler(data: Data?, respone: URLResponse?, error: Error?){
        do {
            let jsonDecoder = JSONDecoder()
            
            if let data = data {
                
                let decodedRes = try jsonDecoder.decode(DataResponce.self, from: data)
                self.result = decodedRes
                
                DispatchQueue.main.async {
                    print(" Data recieved: \(decodedRes)")
                    // if there a property with array value
                    for item in self.result.verses {
                        self.ayat.append(item)
//                        print(item)
                    }
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

