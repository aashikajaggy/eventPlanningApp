//
//  budgetEntryViewController.swift
//  eventPlanningApp
//
//  Created by Akshaya Jagadeesh on 5/8/20.
//  Copyright © 2020 Akshaya Jagadeesh. All rights reserved.
//

import UIKit

class budgetEntryViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

  
  @IBOutlet weak var eventLabel: UILabel!
  @IBOutlet weak var eventTypePicker: UIPickerView!
  var selected1 = ""
  
  @IBOutlet weak var venuePicker: UIPickerView!
  var selected2 = ""
  
  @IBOutlet weak var otherEvent: UITextField!
  
  @IBOutlet weak var otherCuisine: UITextField!
  @IBOutlet weak var cuisinePicker: UIPickerView!
  @IBOutlet weak var dessertPicker: UITextField!
  
  var selected3 = ""
  
  @IBOutlet weak var budgetEntry: UITextField!
  
  @IBAction func moreBudgetInfo(_ sender: Any) {
    if budgetEntry.text != "" {
      performSegue(withIdentifier: "segue", sender: self)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let addBudget = segue.destination as! moreBudgetViewController
    addBudget.bDisplay = budgetEntry.text!
  }
  //var typePickerData: [String] = [String]()
  let picker1Options = ["","Birthday","Graduation Party","Wedding","Anniversary","Baby Shower","Sweet 16","Bachelor Party", "Bachelorette Party","Other"]
  
  
  let picker2Options = [" ","Find me one!","Home","External venue (known)"]
  
  let picker3Options = [" ","Homemade","Known","American","British","Caribbean","Chinese","Desserts","French","Greek","Indian","Italian","Japanese","Mediterranean","Mexican","Moroccan","Spanish","Thai","Turkish","Vietnamese","Other"]
  
    
 
  
  
  
  /*func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    eventLabel.text = typesEvents[row]
  }*/
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if pickerView.tag == 1 {
      return "\(picker1Options[row])"
    }
    else if pickerView.tag == 2{
      return "\(picker2Options[row])"
    }
    else {
      return "\(picker3Options[row])"
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if pickerView.tag == 1 {
      return picker1Options.count
    }
    else if pickerView.tag == 2 {
      return picker2Options.count
    }
    else {
      return picker3Options.count
    }
  }
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if pickerView.tag == 1 {
      selected1 = picker1Options[row]
      if selected1 == "Other" {
       otherEvent?.isHidden = false
      }
    }
    else if pickerView.tag == 2 {
      selected2 = picker2Options[row]
    }
    else  {
      selected3 = picker3Options[row]
      if selected3 == "Other" {
        otherCuisine?.isHidden = false
      }
      if selected3 == "Desserts" {
        dessertPicker?.isHidden = false
      }
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      //Create instance of UserDefaults
      let userDefaults = UserDefaults.standard
      
      //Store values of different objects
      //userDefaults.set(eventTypePicker.label, forKey: "string")
      //userDefaults.set(
       //}
      //Connect Data
      //self.eventTypePicker.delegate = self
      //self.eventTypePicker.dataSource = self
      
      /*typePickerData = ["Birthday","Graduation Party","Wedding","Anniversary","Baby Shower","Sweet 16","Bachelor Party", "Bachelorette Party"] */
        // Do any additional setup after loading the view.
  }
    
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    //Dispose of any resources that can be recreated
  }
  
  // Number of columns of data
  /*func numberOfComponents(in pickerView: UIPickerView) -&gt; Int {
      return 1
  } */
  
  // The number of rows of data
  /*func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -&gt; Int {
      return typePickerData.count
  } */
  
  // The data to return for the row and component (column) that's being passed in
  /*private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int); static func -&;func gt; func String;? {
         return typePickerData[row]
     } */
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

