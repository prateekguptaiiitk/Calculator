//
//  ViewController.swift
//  Calculator
//
//  Created by Prateek Gupta on 25/01/18.
//  Copyright © 2018 Prateek Gupta. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    var newNumber : Double = 0
    var previousNumber : Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        //historyLabel.isHidden = true
        if performingMath == true
        {
            label.text = String(sender.tag)
            newNumber = Double(label.text!)!
            performingMath = false
            historyLabel.text = historyLabel.text! + label.text!
        }
        else
        {
            label.text = label.text! + String(sender.tag)
            newNumber = Double(label.text!)!
            historyLabel.text = historyLabel.text! + String(sender.tag)
        }
    }

    @IBAction func button(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 19 && sender.tag != 18
        {
            previousNumber = Double(label.text!)!

            if sender.tag == 12     // Divide
            {
                label.text = "/"
                historyLabel.text = historyLabel.text! + "/"
            }
            
            else if sender.tag == 13     // Multiply
            {
                label.text = "x"
                historyLabel.text = historyLabel.text! + "x"
            }

            else if sender.tag == 14     // Subtract
            {
                label.text = "-"
                historyLabel.text = historyLabel.text! + "-"
            }
                
            else if sender.tag == 15     // Add
            {
                label.text = "+"
                historyLabel.text = historyLabel.text! + "+"
            }
            else if sender.tag == 18    //Decimal
            {
                label.text = "."
                historyLabel.text = historyLabel.text! + "."
            }
            else if sender.tag == 10    //Percentage
            {
                label.text = "%"
                historyLabel.text = historyLabel.text! + "%"
            }
            
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16    //'=' to button pressed
        {
            if operation == 12          //Divide
            {
                label.text = String(previousNumber / newNumber)
            }
            else if operation == 13     //Multiply
            {
                label.text = String(previousNumber * newNumber)
            }
            else if operation == 14     //Subtract
            {
                label.text = String(previousNumber - newNumber)
            }
            else if operation == 15     //Add
            {
                label.text = String(previousNumber + newNumber)
            }
            else if operation == 10
            {
                label.text = String(previousNumber / 100)
            }
            historyLabel.isHidden = false
        }
        else if sender.tag == 11 // 'C' button pressed
        {
            label.text = ""
            previousNumber = 0
            newNumber = 0
            operation = 0
            historyLabel.text = ""
        }
        else if sender.tag == 19 // 'DEL' button pressed
        {
            label.text = String((label.text?.dropLast())!)
            historyLabel.text = String((historyLabel.text?.dropLast())!)
            newNumber = Double(label.text!)!
        }
        else if sender.tag == 18
        {
            label.text = label.text! + "."
            historyLabel.text = historyLabel.text! + "."
            newNumber = Double(label.text!)!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

