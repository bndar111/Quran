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
/*
 {
   "chapters": [
     {
       "✅id": 1,
       "✅revelation_place": "makkah",
       "revelation_order": 5,
       "bismillah_pre": false,
       "name_simple": "Al-Fatihah",
       "name_complex": "Al-Fātiĥah",
       "✅name_arabic": "الفاتحة",
       "✅verses_count": 7,
       "pages": [
         1,
         1
       ],
       "translated_name": {
         "language_name": "english",
         "name": "The Opener"
       }
     },

 */
