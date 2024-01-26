//
//  SignInViewController.swift
//  eventPlanningApp
//
//  Created by Akshaya Jagadeesh on 7/11/20.
//  Copyright © 2020 Akshaya Jagadeesh. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

  struct RegisteredUser: Codable {
    let userid: String
    let password: String
  }
 
  @IBOutlet weak var userid: UITextField!
  @IBOutlet weak var password: UITextField!
  
  //APPError enum which shows all possible errors
  enum APPError: Error {
      case networkError(Error)
      case dataNotFound
      case jsonParsingError(Error)
      case invalidStatusCode(Int)
  }
  
  //GET
  
  //Result enum to show success or failure
  //THIS
  /*enum Result<T> {
      case success(T)
      case failure(APPError)
  } */
  
  //THIS
  /*
  //dataRequest which sends request to given URL and convert to Decodable Object
  func dataRequest<T: Decodable>(with url: String, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {
      
      //create the url with NSURL
      let dataURL = URL(string: url)! //change the url
      
      //create the session object
      let session = URLSession.shared
      
      //now create the URLRequest object using the url object
    let parameters = [userid.text,password.text]
     
     var request = URLRequest(url: dataURL)
     request.httpMethod = "POST"
     guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
     request.httpBody = httpBody
    
      //create dataTask using the session object to send data to the server
      let task = session.dataTask(with: request, completionHandler: { data, response, error in
          
          guard error == nil else {
              completion(Result.failure(APPError.networkError(error!)))
              return
          }
          
          guard let data = data else {
              completion(Result.failure(APPError.dataNotFound))
              return
          }
          
          do {
              //create decodable object from data
              let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
              completion(Result.success(decodedObject))
          } catch let error {
              completion(Result.failure(APPError.jsonParsingError(error as! DecodingError)))
          }
      })
      
      task.resume()
  } */
  
  override func viewDidLoad() {
         super.viewDidLoad()
       userid.delegate = self
       password.delegate = self
         // Do any additional setup after loading the view.
     }
 
  @IBAction func tappedSignIn(_ sender: Any) {
    
    let userid : String = self.userid.text!
    let password : String = self.password.text!
    
    var responseString: String = ""
    let url = URL(string: "https://goodserviceagent.com/appevpservice/api/member/getapikey")!
    var request = URLRequest(url : url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
   
    
    let parameters = ["userid": userid,"password": password]
   /*guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
    request.httpBody = httpBody*/
    
    //let reguserData = RegisteredUser(userid: userid, password: password)
    /*
    do{
    let jsonData = try JSONEncoder().encode(reguserData)
      request.httpBody = jsonData
    }catch let jsonErr{
        print(jsonErr)
    }
    */
    let jsonData = try! JSONEncoder().encode(parameters)
    let jsonInfo = try? JSONSerialization.data(withJSONObject: parameters)
    let jsonString = String(data: jsonData, encoding: .utf8)!
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

    responseString = String(data: data, encoding: .utf8)!
    }
    
   

  task.resume()
  }

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
  extension SignInViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



