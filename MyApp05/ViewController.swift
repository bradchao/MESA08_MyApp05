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
    
    @IBOutlet weak var pickerView: UIPickerView!
    private let city = ["台北市","台中市","彰化縣","台南市"]
    private var area:[[String]] = []
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        // Date
        let date = sender.date
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "YYYY-MM-dd HH:mm"
        
        let dateString = dateFormat.string(from: date)
        print(dateString)
        
    }

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
            ret = city.count
        }else if (component == 1){
            ret = area[pickerView.selectedRow(inComponent: 0)].count
        }
        return ret
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var ret = ""
        if component == 0 {
            ret = city[row]
        }else if component == 1 {
            ret = area[pickerView.selectedRow(inComponent: 0)][row]
        }
        
        return ret
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            pickerView.reloadComponent(1)
            pickerView.selectRow(0, inComponent: 1, animated: true)
            print("City: \(city[row])")
        }else if component == 1 {
            print("Area: \(area[pickerView.selectedRow(inComponent: 0)][row])")
        }
        
        //print("\(component) : \(row)")
    }
    
    func initView(){
        area += [["中山區","萬華區","士林區","北投區", "大直區"]]
        area += [["西屯區","南屯區","北屯區","中區", "和平區", "西區"]]
        area += [["鹿港鎮","和美鎮","彰化市","花壇鄉", "伸港鄉"]]
        area += [["安平區","永康區","新營區"]]
        
        //var i = pickerView.selectedRow(inComponent: 0)
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.selectRow(0, inComponent: 1, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        initView()

        let now = Date()
        print(now)
        let d1 = Date(timeInterval: 60*60*8, since: now)
        print(d1)
        let d2 = Date(timeInterval: -86400, since: now)
        print(d2)
        
        let formatter = DateFormatter();
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        print(formatter.string(from: now))
        
        let nowCal = Calendar.current
        
        let component = nowCal.dateComponents([.year,.month,.day, .hour, .minute], from: now)
        print("year:\(component.year!), hour:\(component.hour!)")
        
        
        
        
        
        
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

