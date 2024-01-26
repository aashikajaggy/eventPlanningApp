//
//  ViewController.swift
//  eventPlanningApp
//
//  Created by Akshaya Jagadeesh on 5/7/20.
//  Copyright © 2020 Akshaya Jagadeesh. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
  @IBOutlet weak var signIn: UIButton!
  @IBOutlet weak var signUp: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor (red: 102/255, green: 204/255, blue: 204/255, alpha: 0.9)
    //ADD BACK NEXT 2 LINES
    //signIn.backgroundColor = UIColor(red: 255/255, green: 209/255, blue: 219/255, alpha: 0.9)
    //signUp.backgroundColor = UIColor(red: 95/255, green: 75/255, blue: 139/255, alpha: 0.9)
    // Do any additional setup after loading the view.
  
  }
  
  @IBAction func Login(_ sender: UIButton) {
      
      /*
      let gsaurl = URL(string: "https://goodserviceagent.com/appevpservice/api/values")!;
      //create the session object
      let session = URLSession.shared
      var urlRequest = URLRequest(url: gsaurl);
      urlRequest.httpMethod = "GET";
      */
      
      struct ToDo: Decodable {
          let tst : String
      }
      
      dataRequest(with: "https://goodserviceagent.com/appevpservice/api/member", objectType: Array<String>.self) { (result: Result) in
          switch result {
          case .success(let object):
              print(object)
          case .failure(let error):
              print(error)
          }
      }
  }

  //APPError enum which shows all possible errors
  enum APPError: Error {
      case networkError(Error)
      case dataNotFound
      case jsonParsingError(Error)
      case invalidStatusCode(Int)
  }
  
  //Result enum to show success or failure
  enum Result<T> {
      case success(T)
      case failure(APPError)
  }
  
  //dataRequest which sends request to given URL and convert to Decodable Object
  func dataRequest<T: Decodable>(with url: String, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {
      
      //create the url with NSURL
      let dataURL = URL(string: url)! //change the url
      
      //create the session object
      let session = URLSession.shared
      
      //now create the URLRequest object using the url object
      let request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
      
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
  }
  
  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
  }
  */

  
     
    // Do any additional setup after loading the view.
}

