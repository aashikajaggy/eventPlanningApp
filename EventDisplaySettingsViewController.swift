//
//  EventDisplaySettingsViewController.swift
//  eventPlanningApp
//
//  Created by Akshaya Jagadeesh on 6/3/20.
//  Copyright © 2020 Akshaya Jagadeesh. All rights reserved.
//

import UIKit

class EventDisplaySettingsViewController: UIViewController {

  @IBOutlet weak var PublicSettings: UIButton!
  
  @IBOutlet weak var PublicCheckmark: UIImageView!
  
  @IBOutlet weak var PrivateSettings: UIButton!
  
  @IBOutlet weak var PrivateCheckmark: UIImageView!
  
  @IBOutlet weak var CreateList: UIButton!
  
  
  @IBAction func PublicPress(_ sender: UIButton) {
    PublicCheckmark.isHidden = false
    CreateList.isHidden = true
    PrivateCheckmark.isHidden = true
  }
  
  @IBAction func PrivatePress(_ sender: Any) {
    PublicCheckmark.isHidden = true
    CreateList.isHidden = false
    PrivateCheckmark.isHidden = false
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      PrivateCheckmark.isHidden = true
      CreateList.isHidden = true
        // Do any additional setup after loading the view.
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
