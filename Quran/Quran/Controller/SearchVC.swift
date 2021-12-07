//
//  SearchVC.swift
//  Quran
//
//  Created by Abdullah Bajaman on 06/12/2021.
//

import UIKit

class SearchVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        queryList.count
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        queryList[row]
    }
    
    
    @IBOutlet weak var queryPicker: UIPickerView!
    
    var api = API()
    let queryList = ["chapter", "juz", "page", "hizb", "rub"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        queryPicker.delegate = self
        queryPicker.dataSource = self
        
    }
    
    @IBAction func onClickSearch(_ sender: UIButton) {
        
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
