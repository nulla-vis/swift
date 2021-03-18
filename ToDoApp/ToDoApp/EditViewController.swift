//
//  EditViewController.swift
//  ToDoApp
//
//  Created by Nulla on 30/07/20.
//  Copyright © 2020 Azhandi Ismail Usemahu. All rights reserved.
//

import UIKit

class EditViewController: UIViewController{
    
    @IBOutlet weak var textField: UITextField!
    
    var todo:String?
    var index:Int?
    
    var update: (()-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text =  todo
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTodo))
    }
    
    @objc func deleteTodo() {
//        guard let count = UserDefaults().value(forKey: "count") as? Int else {
//            return
//        }
//        let newCount = count - 1
//        UserDefaults.standard.removeObject(forKey: "count")
//        UserDefaults().setValue(nil, forKey: "todo_\(currentPosition)")
//        update?()
//        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editTap(_ sender: UIButton) {
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let currentIndex:Int = index!
        print(currentIndex)
        UserDefaults().set(count, forKey: "count")
        UserDefaults().set(text, forKey: "todo_\(currentIndex+1)")
        update?()
        navigationController?.popViewController(animated: true)
    }
    
}
