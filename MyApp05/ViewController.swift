//
//  ViewController.swift
//  MyApp05
//
//  Created by user22 on 2017/9/18.
//  Copyright © 2017年 Brad Big Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var btnNumber1: UIButton!
    
    private let items = ["iPhone","Android","Windows","iPad","Apple Watch"]
    private let item2s = ["Item1","Item2","Item3","Item4","Item5","Item6","Item7",]
    

    @IBAction func clickNumber1(_ sender: Any) {
        btnNumber1.isEnabled = false
        //showDialog()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var ret = 0;
        if component == 0 {
            ret = items.count
        }else if (component == 1){
            ret = item2s.count
        }
        return ret
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var ret = ""
        if component == 0 {
            ret = items[row]
        }else if component == 1 {
            ret = item2s[row]
        }
        
        return ret
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //showDialog()
        print("viewDidLoad")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        showDialog()
    }
    
    private func showDialog(){
        let alert = UIAlertController(title: "Welcome", message: "World", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default){
            (aAction) in
            let account = alert.textFields![0].text
            let passwd = alert.textFields![1].text
            print("\(account!):\(passwd!)")
        }
        alert.addAction(action)
        
        alert.addTextField { (aTextField) in
            aTextField.placeholder = "輸入帳號"
        }
        
        alert.addTextField { (aTextField) in
            aTextField.placeholder = "輸入密碼"
            aTextField.isSecureTextEntry = true
        }
        
        
        
        
        show(alert, sender: self)
        
    }
    

}

