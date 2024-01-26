//
//  moreBudgetViewController.swift
//  eventPlanningApp
//
//  Created by Akshaya Jagadeesh on 5/12/20.
//  Copyright © 2020 Akshaya Jagadeesh. All rights reserved.
//

import UIKit



class moreBudgetViewController: UIViewController {

  @IBOutlet weak var addFields: UIButton!
  var textFields: [UITextField] = []
  let textFieldSize = CGSize(width: 158, height: 34)
  let textFieldSize2 = CGSize(width: 131, height: 30)
  
  @IBOutlet weak var budgetDisplay: UILabel!
  
  @IBOutlet weak var venueText: UITextField!
  @IBOutlet weak var foodText: UITextField!
  @IBOutlet weak var decorText: UITextField!
  
  var bDisplay = String()
  /*@IBAction func tappedButton(button: UIButton!) {
    if addFields.isSelected == true {
    let y = CGFloat(textFields.count) * textFieldSize.height
    let textField = UITextField(frame: CGRect(origin: CGPoint(x: 0, y: y), size: textFieldSize))
    view.addSubview(textField)
    textFields.append(textField)
    }
  } */
  
  func subtractBudget(moneyInput: Double) {
    if budgetDisplay.text != "" {
      var display: Double = Double(bDisplay)!
      display -= moneyInput
      print(bDisplay)
      let newDisplay : String = String(display)
      budgetDisplay?.text = newDisplay
      /*
      var newDisplay: Double = Double(budgetDisplay.text ?? "")!
      newDisplay -= moneyInput
      print(newDisplay)
      let newNewDisplay: String = String(newDisplay)
      budgetDisplay.text = newNewDisplay
     */
    }
  }
  
  var boxInitHeight = 433
  var plusInitHeight = 527.5
  var dollarInitHeight = 432
  @IBAction func tappedButton(_ sender: UIButton) {
    //let x = CGFloat(textFields.count) * textFieldSize.width
    //let y = CGFloat(textFields.count) * textFieldSize.height
    let titleTextField =  UITextField(frame: CGRect(origin: CGPoint(x: 37, y: boxInitHeight+95), size: textFieldSize2))
    let textField = UITextField(frame: CGRect(origin: CGPoint(x: 230, y: boxInitHeight+95), size: textFieldSize))
    textField.borderStyle = UITextField.BorderStyle.line
    textField.backgroundColor = UIColor.white
    view.addSubview(textField)
    textFields.append(textField)
    titleTextField.borderStyle = UITextField.BorderStyle.line
    titleTextField.backgroundColor = UIColor.white
    view.addSubview(titleTextField)
    //addFields = UIButton(frame: CGRect(x: 169, y: plusInitHeight+94.5,width: 76, height: 66))
    addFields.frame = CGRect(x: 169, y: plusInitHeight+94.5,width: 76, height: 66)
    let dollarLabel: UILabel = UILabel()
    dollarLabel.frame = CGRect(x: 207, y: dollarInitHeight+95, width: 17, height: 32)
    dollarLabel.textColor = UIColor.black
    dollarLabel.text = "$"
    dollarLabel.font = dollarLabel.font.withSize(26.0)
    view.addSubview(dollarLabel)
    boxInitHeight = boxInitHeight + 95
    plusInitHeight = plusInitHeight + 94.5
    dollarInitHeight = dollarInitHeight + 95
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    budgetDisplay.text = bDisplay
    if let vT:Double = Double(venueText.text!) {
      subtractBudget(moneyInput: vT)
    }
    if let fT:Double = Double(foodText.text!) {
      subtractBudget(moneyInput: fT)
    }
    if let dT:Double = Double(decorText.text!) {
      subtractBudget(moneyInput: dT)
    }
        // Do any additional setup after loading the view.
    }
  
  func textFieldFunc(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) != nil {
         return true
      } else {
         return false
      }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
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
