//
//  SignUpViewController.swift
//  eventPlanningApp
//
//  Created by Akshaya Jagadeesh on 7/9/20.
//  Copyright © 2020 Akshaya Jagadeesh. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  
  @IBOutlet weak var FirstName: UITextField!
  @IBOutlet weak var LastName: UITextField!
  @IBOutlet weak var StreetAddress: UITextField!
  @IBOutlet weak var State: UIPickerView!
  @IBOutlet weak var DOB: UIDatePicker!
  @IBOutlet weak var Username: UITextField!
  @IBOutlet weak var Password: UITextField!
  @IBOutlet weak var RePassword: UITextField!
  @IBOutlet weak var Email: UITextField!
  @IBOutlet weak var PhoneNumber: UITextField!
  @IBOutlet weak var CollegeBool: UISwitch!
  @IBOutlet weak var CollegeNamePicker: UIPickerView!
  var selectedCollege = ""
  var selectedState = ""
  //var selectedCollegeName: String?
  
  struct College: Decodable {
      let name: String?
  
    func getString() {
        //print( "Name: \(name)" )
      print( "\(name) " )
    }
  }
  
  struct StateStruct: Decodable {
    let name: String?
  }

  /*struct newUser: Codable {
   var FirstName: String
   var  LastName: String
  
   var StreetAddress: String
   var State: String
   var DOB: NSDate
   var Username: String
   var Password: String
   var RePassword: String
   var Email: String
   var PhoneNumber: String
   var CollegeBool: Bool
   var CollegeName: String

  
  
  
  init(FirstName : String, LastName: String, StreetAddress: String, State: String, DOB: NSDate, Username: String, Password: String, RePassword: String, Email: String, PhoneNumber: String, CollegeBool: Bool, CollegeName: String)
  {
    //self.init(FirstName: <#String#>)
    self.FirstName = FirstName
    self.LastName = LastName
    self.StreetAddress = StreetAddress
    self.State = State
    self.DOB = DOB
    self.Username = Username
    self.Password = Password
    self.RePassword = RePassword
    self.Email = Email
    self.PhoneNumber = PhoneNumber
    self.CollegeBool = CollegeBool
    self.CollegeName = CollegeName
  }
 }*/
  
  //APPError enum which shows all possible errors
  enum APPError: Error {
      case networkError(Error)
      case dataNotFound
      case jsonParsingError(Error)
      case invalidStatusCode(Int)
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      FirstName.delegate = self
      LastName.delegate = self
      StreetAddress.delegate = self
      State.delegate = self
      Username.delegate = self
      Password.delegate = self
      RePassword.delegate = self
      Email.delegate = self
      PhoneNumber.delegate = self
      /*CollegeNamePicker.dataSource = self as? UIPickerViewDataSource
      CollegeNamePicker.delegate = self as? UIPickerViewDelegate*/
      
      CollegeNamePicker.dataSource = self
      CollegeNamePicker.delegate = self
      
      getCollegeData()
      self.CollegeNamePicker.reloadAllComponents()
      getStatesData()
      self.State.reloadAllComponents()
    }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  //GET Request for College Names UIPicker
  //var collegesArray : [String] = []
  var collegesArray: [String] = [String]()
  var statesArray: [String] = [String]()
  var responseString: String = ""
  
  //let url = URL(string: "https://goodserviceagent.com/appevpservice/api/member/common")!
  
  let collegeUrl = NSURL(string: "https://goodserviceagent.com/appevpservice/api/common/GetCampuses")! as URL
  let statesUrl = NSURL(string: "https://goodserviceagent.com/appevpservice/api/common/GetStates")! as URL
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
    if pickerView.tag == 1 {
      return statesArray.count
    }
      return collegesArray.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if pickerView.tag == 1 {
      return self.statesArray[row]
    }
      return self.collegesArray[row]
    //return (collegesArray.name).[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if pickerView.tag == 1 {
      selectedState = statesArray[row]
      self.State.reloadAllComponents()
    }
    else {
    selectedCollege = collegesArray[row]
    self.CollegeNamePicker.reloadAllComponents()
    }
  }
  
  
  func getCollegeData() {
    /*var request = URLRequest(url : collegeUrl)
    //var request = Foundation.URL(string: "https://goodserviceagent.com/appevpservice/api/member/common")
    //var request = NSURL(string: "https://goodserviceagent.com/appevpservice/api/member/common")! as URL
    request(collegeUrl, method: .get).responseJSON { (response) in
      if response.result.isSuccess {
        print("College Data Success")
        collegesArray = try JSONDecoder().decode([College].self, from: #yourJsonData#)
        CollegeNamePicker.reloadAllComponents()
      }
    }*/
    
    //create the session object
    let session = URLSession.shared

    //now create the URLRequest object using the url object
    let request = URLRequest(url: collegeUrl)
    
    //create dataTask using the session object to send data to the server
    let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

        guard error == nil else {
          print("error occurred")
          return
        }

        guard let data = data else {
          print("data not received")
          return
        }

      /*let path = Bundle.main.path(forResource: "name", ofType: "json")
      let tempCollegesArray = try! JSONSerialization.jsonObject(with: Data(contentsOf: URL(path!)), options: JSONSerialization.ReadingOptions()) as? [Any]
          for collegeDict in tempCollegesArray! {
            if let dict = collegeDict as? [String: Any], let addArray = dict["name"] as? SignUpViewController.College {
              self.collegesArray.append(addArray)
              self.CollegeNamePicker.reloadAllComponents()
            }
          }*/
      
      //This is where i left off before
      
      /*let json = try? JSONSerialization.jsonObject(with: data, options: [])
        print(json as Any)
      if let colleges = json!["name"] as? SignUpViewController.College,
          let collegeName = colleges["name"] as? String {
          print("HIIIIIII")
          self.collegesArray.append(collegeName as! SignUpViewController.College)
          
        }*/
      var tempCollegesArray = [String: College]()
      let json = try? JSONSerialization.jsonObject(with: data, options: [])
      if let object = json as? [String: Any] {
          // json is a dictionary
          print(object)
      } else if let object = json as? [Any] {
          // json is an array
          for anItem in object as! [Dictionary<String, AnyObject>] {
            let collegeTempName = anItem["name"] as! String
              let collegeTemp = College(name: collegeTempName)
            tempCollegesArray[collegeTempName] = collegeTemp
            //self.collegesArray[collegeTempName]?.getString()
          }
      }
      else {
        print("JSON is invalid")
      }

        
      //}
      var keys = tempCollegesArray.keys
      for key in keys {
        self.collegesArray.append(key)
      }
      //self.collegesArray = keys
      //print(self.collegesArray)
     
        
        //}
    //}
        //self.collegesArray.append()
        //}
      })
      task.resume()
    }
  
  func getStatesData() {
    //create the session object
    let session = URLSession.shared

    //now create the URLRequest object using the url object
    let request = URLRequest(url: statesUrl)
    
    //create dataTask using the session object to send data to the server
    let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

        guard error == nil else {
          print("error occurred")
          return
        }

        guard let data = data else {
          print("data not received")
          return
        }
      var tempStatesArray = [String: StateStruct]()
           let json = try? JSONSerialization.jsonObject(with: data, options: [])
           if let object = json as? [String: Any] {
               // json is a dictionary
               print(object)
           } else if let object = json as? [Any] {
               // json is an array
               for anItem in object as! [Dictionary<String, AnyObject>] {
                 let stateTempName = anItem["iD_state"] as! String
                   let stateTemp = StateStruct(name: stateTempName)
                 tempStatesArray[stateTempName] = stateTemp
                //print(object)
               }
           }
           else {
             print("JSON is invalid")
           }

             
           //}
           var keys = tempStatesArray.keys
           for key in keys {
             self.statesArray.append(key)
           }
      print(self.statesArray)
           })
           task.resume()
  }
  
  
  @IBAction func tappedSignUp(_ sender: Any) {
    if (Password.text != RePassword.text) {
      let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! SUPasswordPopUpViewController
      self.addChild(popOverVC)
      popOverVC.view.frame = self.view.frame
      self.view.addSubview(popOverVC.view)
      popOverVC.didMove(toParent: self)
    }
    
    
    let FirstName : String = self.FirstName.text!
    let LastName : String = self.LastName.text!
    let StreetAddress : String = self.StreetAddress.text!
    let DOB : NSDate = self.DOB?.date as! NSDate
    let Username : String = self.Username.text!
    let Password : String = self.Password.text!
    let RePassword : String = self.RePassword.text!
    let Email : String = self.Email.text!
    let PhoneNumber : String = self.PhoneNumber.text!
    let CollegeBool : Bool = self.CollegeBool!.isOn
    
    let inCollege : String
    
    if CollegeBool == true {
      inCollege = "yes"
    }
    else {
      inCollege = "no"
    }
    
    var DOBdate = Date()
    
    let postUrl = NSURL(string: "https://goodserviceagent.com/appevpservice/api/member/RegisterUser")! as URL
    
     var request = URLRequest(url : postUrl)
     request.setValue("application/json", forHTTPHeaderField: "Content-Type")
     request.httpMethod = "POST"

    //can you send boolean through JSON to API?
    let parameters = ["FirstName": FirstName,"LastName": LastName, "StreetAddress": StreetAddress, "State": selectedState, "DOB": DOB, "Username": Username, "Password": Password, "RePassword": RePassword, "Email": Email, "PhoneNumber": PhoneNumber, "CollegeBool": inCollege, "CollegeName": selectedCollege] as [String : Any]
    
    
    //let jsonData = try! JSONEncoder().encode(newUser)
    let jsonInfo = try? JSONSerialization.data(withJSONObject: parameters)
    //let jsonString = String(data: jsonData, encoding: .utf8)!
    request.httpBody = jsonInfo
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data, error == nil else {                                                 // check for fundamental networking error
          print("error=\(String(describing: error))")
          return
      }

      if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
          print("statusCode should be 200, but is \(httpStatus.statusCode)")
          print("response = \(String(describing: response))")
      }

      self.responseString = String(data: data, encoding: .utf8)!
      }

    task.resume()
  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    PhoneNumber.resignFirstResponder()
  }
  
}
  
extension SignUpViewController : UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}


//do {
      //create json object from data
      //if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [College] {
//if let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? [College] {

//if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
  //self.collegesArray = json
  //self.collegesArray.append(json as! SignUpViewController.College)

/*
let json = try? JSONSerialization.jsonObject(with: data, options: [])
print(json)
self.collegesArray.append(json as! SignUpViewController.College)
self.CollegeNamePicker.reloadAllComponents()
*/



/*extension SignUpViewController : UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    let CollegeName: String
    switch pickerView {
    case CollegeNamePicker:
      CollegeName = CollegeNamePicker![row]
    default:
      break
      CollegeName = ""
    }
  }
  /*-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger) component {
  
  }*/
  
}*/

/*let parameters = [FirstName,LastName,StreetAddress,State,DOB,Username,Password,RePassword,Email,PhoneNumber,CollegeBool,CollegeName]

    guard let url = URL(string: "https://goodserviceagent.com/appevpservice/api/member") else { return }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
  guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
  request.httpBody = httpBody
  
  let session = URLSession.shared
  session.dataTask(with: request){(data,response,error) in
    if let response = response {
      print(response)
    }
    if let data = data {
      do {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        print(json)
      } catch {
        print(error)
      }
    }
  }*/

//GET Request
/*func chooseCollege(_ url: String, parameters: [String: String], completion: @escaping ([String: Any]?, Error?) -> Void) {
    
  var components = URLComponents(string: url)!
  components.queryItems = parameters.map { (key, value) in
    URLQueryItem(name: key, value: value)
}
  
components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
let request = URLRequest(url: components.url!)

  let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data,                        // is there data
      let response = response as? HTTPURLResponse,  // is there HTTP response
      (200 ..< 300) ~= response.statusCode,         // is statusCode 2XX
      error == nil else {                           // was there no error, otherwise ...
        completion(nil, error)
        return
      }

      let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
      completion(responseObject, nil)
  }
  task.resume()
}*/

/*guard let url = URL(string: "https://goodserviceagent.com/appevpservice/api/member") else { return }

let session = URLSession.shared
session.dataTask(with: url) {(data, response, error) in
if let response = response {
print(response)
}
if let data = data {
  print(data)
}
}.resume() */



/*struct APIRequest {
  let resourceURL: URL
  init (endpoint: String) {
    let resourceString = "https://goodserviceagent.com/appevpservice/api/member/\(endpoint)"
    guard let resourceURL = URL(string: resourceString) else {fatalError()}
    self.resourceURL = resourceURL
  }
  
  func save (_ String: FirstName, String: LastName, String: StreetAddress, String: State, NSDate: DOB, String: Username, String: Password, String: RePassword, String: Email, String: PhoneNumber, Bool: CollegeBool, String: CollegeName, completion: @escaping(Result<APIError>)->Void) {
    do {
      var urlRequest = URLRequest(url: resourceURL)
      urlRequest.httpMethod = "POST"
      urlRequest.addValue("application/json", forHTTPHeaderField: "Content-type")
      urlRequest.httpBody = try JSONEncoder().encode(FirstName)
      
      let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
        let jsonData = data else {
          completion(.failure(.responseProblem))
          return
        }
        do {
          
        }
      }
    }
  }
} */
