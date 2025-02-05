//
//  StartViewController.swift
//  TellTale
//
//  Created by Reina Nakade on 2025/01/22.
//

import UIKit

class StartViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var pickerdata: String!
    
    var peoplenumber: Int = 0

    //これは元々number表記だったが、peopleviewconのpeoplenumber(元number)と同一と見做し一度変化させたがワンチャン違う。要注意。
    var saveData: UserDefaults = UserDefaults.standard
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var startButton: UIButton!
    
    let dataList = ["恋愛","友情","ホラー","ミステリー","グロ","百合"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self

        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerdata = dataList[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWriteNovel" {
            let WrittingViewController = segue.destination as! WrittingViewController
            WrittingViewController.peoplenumber = peoplenumber

            saveData.set(self.pickerdata, forKey: "themedata")
            
            
            
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
