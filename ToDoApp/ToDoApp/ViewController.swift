//
//  ViewController.swift
//  ToDoApp
//
//  Created by Nulla on 30/07/20.
//  Copyright © 2020 Azhandi Ismail Usemahu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableview : UITableView!
    
    var todos  = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Todo"
        
        tableview.delegate = self
        tableview.dataSource = self
        
        //setup
        
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        //Get all current saved todos
        updateTodo()
    }
    
    func updateTodo()  {
        
        todos.removeAll()
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        for x in 0..<count {
            if let todo = UserDefaults().value(forKey: "todo_\(x+1)") as? String {
                todos.append(todo)
            }
        }
        tableview.reloadData()
    }
    
    @IBAction func didAdd() {
        
        let vc = storyboard?.instantiateViewController(identifier: "entry") as!EntryViewController
        vc.title = "New Todo"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTodo()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "edit") as! EditViewController
        vc.todo = todos[indexPath.row]
        vc.index = indexPath.row
        vc.title = "Edit Todo"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTodo()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
}
