//
//  ViewController.swift
//  TableView
//
//  Created by Nulla on 28/07/20.
//  Copyright © 2020 Azhandi Ismail Usemahu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var classsSelect: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    //Title
    var classess = ["E2C", "E2K", "E2L", "E2P", "dummyclass"]
    
    //Title's item(s)
    var students = [["Azu", "Aldo", "Sugata", "Kane"],
                    ["Ferry", "Geo"],["Enrico"],["dummy"]
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        //何が処理が発動したら、自分のところにあるメソッド使うこと:
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

    @IBAction func addData(_ sender: UIButton) {
        //get data from textfield
//        let className = classsSelect.text
//        let studentName = nameInput.text
        //insert data to textfield
//        var row2 = [String]()
//        row2.append("lol")
//        students.append(row2)
        print("isThisWork?")
        insertNewStudent()
    }
    
    func insertNewStudent() {
        
        var classIndex = 0
        switch classsSelect.text {
        case "E2C":
            classIndex = 0
        case "E2K":
            classIndex = 1
        case "E2L":
            classIndex = 2
        case "E2P":
            classIndex = 3
        default:
            classIndex = 5
        }
        
        if (classIndex != 5) {
            students[classIndex].append(nameInput.text!)
            let indexPath = IndexPath(row: students[classIndex].count-1, section: classIndex)

            tableView.beginUpdates()
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students[section].count
    }
    
    //classessを付く(Table's title)
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return classess[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = students[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(students[indexPath.section][indexPath.row])
    }
    
    
}
