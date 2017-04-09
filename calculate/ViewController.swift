//
//  ViewController.swift
//  calculate
//
//  Created by Taras on 4/8/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

var x: Double = 0
var y: Double = 0

var decimalPoint = 0
var power = 1

var enteredValue = 1
var yEnteredValue = 1

var operationsInProgress = 0

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func numerals(_ sender: UIButton) {
  
//    print("Numeral \(sender.tag)")
    
    if enteredValue == 1 {
      x = 0
      enteredValue = 0
    }
    if decimalPoint == 0 {
    x = x * 10 + Double(sender.tag)
      
      //converting Double into Int value if needed and in which cases it's necessary
      switch String(x) {
      case let z where z.hasSuffix(".0"):
        self.result.text = " " + String(Int(x))
      default: self.result.text = " " + String(x)
      }
    
    }else {
      /*to our number (x) is added our entered number (Double(sender.tag)) which is divided by 10 raised to the power of power;
       function pow is created to exponentiate the first entered number (10) into the power of the second entered number */
      x = x + Double(sender.tag) / pow(10, Double(power))
      power += 1
      
      //converting Double into Int value if needed and in which cases it's necessary
      switch String(x) {
      case let z where z.hasSuffix(".0"):
        self.result.text = " " + String(Int(x))
      default: self.result.text = " " + String(x)
      }
    }
  }

  @IBAction func numeralsInverse(_ sender: Any) {
    
    //inverse of positive value into negative and vice versa
    x = -x
    
    //converting Double into Int value if needed and in which cases it's necessary
    switch String(x) {
    case let z where z.hasSuffix(".0"):
      self.result.text = " " + String(Int(x))
    default: self.result.text = " " + String(x)
    }
  }

  @IBAction func operations(_ sender: UIButton) {
  
//    print("Operation \(sender.tag)")
    if enteredValue != 1 && yEnteredValue == 1 {
      switch operationsInProgress {
      
      case 1001:
        x = y + x
        
      case 1002:
        x = y - x
      
      case 1003:
        x = y * x
        
      case 1004:
        x = y / x
        
      default:
        self.result.text = " " + String(x)
      }
    }
    operationsInProgress = sender.tag
    y = x
    yEnteredValue = 1
    enteredValue = 1
    
    //converting Double into Int value if needed and in which cases it's necessary
    switch String(x) {
    case let z where z.hasSuffix(".0"):
      self.result.text = " " + String(Int(x))
    default: self.result.text = " " + String(x)
    }
    decimalPoint = 0
    power = 1
  }

  @IBAction func decimal(_ sender: UIButton) {
  
//    print("Decimal \(sender.tag)")
  
    if decimalPoint == 0 {
      decimalPoint = 1
    }
  }

  @IBAction func clearAll(_ sender: UIButton) {
  
    //returning program to it basic state
    decimalPoint = 0
    
    x = 0
    y = 0
    
    //converting Double into Int value if needed and in which cases it's necessary
    switch String(x) {
    case let z where z.hasSuffix(".0"):
      self.result.text = " " + String(Int(x))
    default: self.result.text = " " + String(x)
    }
    power = 1
    enteredValue = 1
    yEnteredValue = 1
    operationsInProgress = 0
    
  }

  @IBOutlet weak var result: UILabel!
}

