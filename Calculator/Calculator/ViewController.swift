//
//  ViewController.swift
//  Calculator
//
//  Created by Nulla on 13/07/20.
//  Copyright © 2020 Azhandi Usenahu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var holder: UIView!
    
    var firstNum = 0
    var resultNum = 0
    var currentOperators:Operator?
    
    enum Operator {
        case  plus,minus,multipy,divide
    }
    
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font  = UIFont(name: "Helvetica", size: 100)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupNumberPad()
    }
    
    private func setupNumberPad() {
        let buttonSize:CGFloat = view.frame.size.width / 4
        //zero button
        let zeroButton = UIButton(frame: CGRect(x: 0, y: holder.frame.size.height - buttonSize, width: buttonSize * 3, height: buttonSize))
        zeroButton.setTitleColor(.black, for: .normal)
        zeroButton.backgroundColor = .white
        zeroButton.setTitle("0", for: .normal)
        zeroButton.tag = 1
        zeroButton.addTarget(self, action: #selector(zeroTapped), for: .touchUpInside)
        holder.addSubview(zeroButton)
        //1-3 buttons
        for x in 0..<3 {
            let button1 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height - (buttonSize * 2), width: buttonSize, height: buttonSize))
            button1.setTitleColor(.black, for: .normal)
            button1.backgroundColor = .white
            button1.setTitle("\(x + 1)", for: .normal)
            holder.addSubview(button1)
            button1.tag = x+2
            button1.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        //4-6 buttons
        for x in 0..<3 {
            let button2 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height - (buttonSize * 3), width: buttonSize, height: buttonSize))
            button2.setTitleColor(.black, for: .normal)
            button2.backgroundColor = .white
            button2.setTitle("\(x + 4)", for: .normal)
            holder.addSubview(button2)
            button2.tag = x+5
            button2.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        //7-9 buttons
        for x in 0..<3 {
            let button3 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height - (buttonSize * 4), width: buttonSize, height: buttonSize))
            button3.setTitleColor(.black, for: .normal)
            button3.backgroundColor = .white
            button3.setTitle("\(x + 7)", for: .normal)
            holder.addSubview(button3)
            button3.tag = x+8
            button3.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        //clear All Button
        let clearButton = UIButton(frame: CGRect(x: 0, y: holder.frame.size.height - (buttonSize * 5), width: view.frame.size.width - buttonSize, height: buttonSize))
               clearButton.setTitleColor(.black, for: .normal)
               clearButton.backgroundColor = .white
               clearButton.setTitle("Clear All", for: .normal)
               holder.addSubview(clearButton)
        
        //operators
        //store the string in Array
        let operators = ["=","+","-","x","÷"]
        //arrang array to buttons
        for x in 0..<5 {
            let button4 = UIButton(frame: CGRect(x: buttonSize * 3, y: holder.frame.size.height - (buttonSize * CGFloat(x+1)), width: buttonSize, height: buttonSize))
            button4.setTitleColor(.white, for: .normal)
            button4.backgroundColor = .blue
            button4.setTitle(operators[x], for: .normal)
            holder.addSubview(button4)
            button4.tag = x + 1
            button4.addTarget(self, action: #selector(operatorPressed(_:)), for: .touchUpInside)
        }
        
        //label
        resultLabel.frame = CGRect(x: 20, y:  clearButton.frame.origin.y - 110, width: view.frame.size.width - 40, height: 100)
        holder.addSubview(resultLabel)
        
        //Action(s)
        clearButton.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
    }
    
    @objc func clearResult() {
        resultLabel.text = "0"
        currentOperators = nil
        
        firstNum = 0
    }
    
    @objc func zeroTapped() {
        if resultLabel.text != "0" {
            if let text = resultLabel.text {
                resultLabel.text = "\(text)\(0)"
            }
         }
    }
    
    @objc func numberPressed(_ sender: UIButton) {
        let tag = sender.tag - 1 //not gonna add 0 in label except the initial value when app is open
        
        if resultLabel.text == "0" {
            resultLabel.text = "\(tag)"
        }else if let text = resultLabel.text{
            resultLabel.text = "\(text)\(tag)"
        }
    }
    
    @objc func operatorPressed(_ sender: UIButton) {
        let tag = sender.tag //not gonna add 0 in label except the initial value when app is open
        
        if let text = resultLabel.text, let value = Int(text), firstNum == 0 {
            firstNum = value
            //reset label
            resultLabel.text = "0"
        }
        
        if tag == 1 {
            if let operation = currentOperators {
                var secondNum = 0
                if let text = resultLabel.text, let value = Int(text) {
                    secondNum =  value
                }
                switch operation {
                case .plus:
                    let result = firstNum + secondNum
                    resultLabel.text = "\(result)"
                    break
                case .minus:
                    let result = firstNum - secondNum
                    resultLabel.text = "\(result)"
                    break
                case .multipy:
                    let result = firstNum * secondNum
                    resultLabel.text = "\(result)"
                    break
                case .divide:
                    let result = firstNum / secondNum
                    resultLabel.text = "\(result)"
                    break
                }
            }
        }else if tag == 2 {
            currentOperators = .plus
        }else if tag == 3 {
            currentOperators = .minus
        }else if tag == 4 {
            currentOperators = .multipy
        }else if tag == 5 {
            currentOperators = .divide
        }
    }

}
