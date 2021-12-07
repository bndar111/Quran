//
//  SearchVC.swift
//  Quran
//
//  Created by Abdullah Bajaman on 06/12/2021.
//

import UIKit

class SearchVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var queryPicker: UIPickerView!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var input: UITextField!
    var api = API()
    let queryList = ["Chapter Number", "Juz Number", "Page Number", "Hizb Number", "Rub Number"]
    var selectedQuery = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        queryPicker.delegate = self
        queryPicker.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return queryList.count
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return queryList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textBox.text = queryList[row]
        
        self.queryPicker.isHidden = true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.textBox {

            self.queryPicker.isHidden = false
            textField.endEditing(true)

        }
    }
    
    @IBAction func onClickSearch(_ sender: UIButton) {
        
        
        let vc = (storyboard?.instantiateViewController(withIdentifier: "ayatID")) as! AyatVC
        vc.query[textBox.text!] = input.text!
        self.navigationController?.show(vc, sender: self)
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
