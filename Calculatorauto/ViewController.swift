//
//  ViewController.swift
//  Calculatorauto
//
//  Created by Vijay Bhati on 15/11/17.
//  Copyright © 2017 Vijay Bhati. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var displayField: UILabel!
    
    //Variables Declaration
    var firstNumber = ""
    var secondNumber = ""
    var cnt:Int = 1
    var oneNum : Double = 0
    var secondNum : Double = 0
    var op: Int = 0
    var temp = ""
    var flag : Int = 0
    let dict : [Int:String] = [12:"%", 13:"÷", 14:"+", 15:"-", 16:"X"]
    let number : [Int:String] = [0:"0", 1:"1", 2:"2", 3:"3", 4:"4", 5:"5", 6:"6", 7:"7", 8:"8", 9:"9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func ButtonPressed(_ sender: UIButton) {
        if (sender.tag == 10 || flag == 1) {
            displayField.text! = ""
            firstNumber = ""
            secondNumber = ""
            cnt = 1;
            flag = 0
        }
        if (sender.tag >= 0 && sender.tag <= 9) {
            if (cnt == 1) {
                firstNumber = firstNumber + number[sender.tag]!;
                displayField.text! = firstNumber
            } else {
                secondNumber = secondNumber + number[sender.tag]!
                displayField.text! = temp + secondNumber
            }
        }
        if (sender.tag == 11) {
            let result = Double(displayField.text!)!
            displayField.text! = String(-1 * result)
            if (cnt == 1) {
                firstNumber = String(-1 * result)
            } else {
                secondNumber = String(-1 * result)
            }
        }
        if (sender.tag >= 12 && sender.tag <= 16) {
            op = sender.tag
            temp = firstNumber + dict[op]!
            displayField.text! = temp
            cnt = 2
        }
        if (sender.tag == 17) {
            flag = 1;
            oneNum = Double(firstNumber)!
            secondNum = Double(secondNumber)!
            if (op == 12) {
                let result = Int(oneNum.truncatingRemainder(dividingBy: secondNum))
                displayField.text! = String(result)
            }
            if (op == 13) {
                displayField.text! = String(oneNum / secondNum)
            }
            else if (op == 14) {
                displayField.text! = String(oneNum + secondNum)
            }
            else if (op == 15) {
                displayField.text! = String(oneNum - secondNum)
            }
            else if (op == 16) {
                displayField.text! = String(oneNum * secondNum)
            }
        }
        if (sender.tag == 18) {
            displayField.text! = displayField.text! + "."
            if (cnt == 1) {
                firstNumber = firstNumber + "."
            } else {
                secondNumber = secondNumber + "."
            }
        }
        
    }
    
}

