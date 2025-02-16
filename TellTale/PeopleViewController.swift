//
//  PeopleViewController.swift
//  TellTale
//
//  Created by Reina Nakade on 2025/01/22.
//

import UIKit

class PeopleViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var peopleTitleLabel: UILabel!
    @IBOutlet var peopleCountLabel: UILabel!
    @IBOutlet var peopleTable: UITableView!
    
    
    var peoplenumber: Int = 0
    //numberの名称変更につき、エラーの可能性あり。要注意。
    
    var playerArray: [String] = Array(repeating: "", count: 20)
    var saveData: UserDefaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleTable.dataSource = self
        peopleTable.delegate = self
        peopleTable.register(UINib(nibName: "PeopleCustomTableViewCell", bundle: nil),forCellReuseIdentifier: "PeopleCell")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plusButton() {
        peoplenumber = min(peoplenumber + 1, 20)
        updatePeopleCount()
        
    }
    @IBAction func minusButton() {
        peoplenumber = max(peoplenumber - 1, 0)
        updatePeopleCount()
    }
    func updatePeopleCount() {
        peopleCountLabel.text = String(peoplenumber)
        peopleTable.reloadData()
    }
    
    
    
    //MARK: セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peoplenumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath) as? PeopleCustomTableViewCell {
            
            cell.playerTextField.text = playerArray[indexPath.row]
            cell.playerTextField.placeholder = "Player \(indexPath.row + 1)"
            
            cell.onNameChanged = { [weak self] name in
                self?.playerArray[indexPath.row] = name
            }
            
            return cell
        } else {
            // セルの取得に失敗した場合の処理
            return UITableViewCell() // 必要に応じて適切なセルを返す
        }
        
    }
    
    @IBAction func peopleCancelButton() {
        self.dismiss(animated: true)
        
        //        self.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStart" {
            peopleTable.endEditing(true)
            _ = segue.destination as! StartViewController
            saveData.set(playerArray, forKey: "people")
            saveData.set(peoplenumber, forKey: "peoplenumber")

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
