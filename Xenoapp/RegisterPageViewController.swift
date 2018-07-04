//
//  RegisterPageViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 16/06/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

// Setting up the protocol for the segue transition.
protocol registerNewUserDelegate {
    func parseData()
}

class RegisterPageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var schoolName: UITextField!
    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var dropDown: UIPickerView!
    @IBOutlet weak var submitButton: UIButton!
    
    var delegate : registerNewUserDelegate?
    var categoryArray = [List2]()
    var helperString: String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Calling the "parse" function to use the API.
        parseData2()
        
        // Declaring delegates.
        schoolName.delegate = self
        emailID.delegate = self
        Password.delegate = self
        phoneNumber.delegate = self
        categoryTextField.delegate = self
        dropDown.delegate = self
        dropDown.dataSource = self
        
        // Hide the picker view when the app starts.
        self.dropDown.isHidden = true
        
    }
    
    // Dismissing the keyboard.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    // Implementing the return functionality of keybpard.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == schoolName {
            
            emailID.becomeFirstResponder()
            
        }
        else if textField == emailID {
            
            Password.becomeFirstResponder()
            
        }
        else if textField == Password {
            
            phoneNumber.becomeFirstResponder()
            
        }
        else if textField == phoneNumber {
            
            textField.resignFirstResponder()
            
        }
        
        return true
        
    }

    // Setting up the PickerView.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return categoryArray.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return categoryArray[row].cat_full_name
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.categoryTextField.text = self.categoryArray[row].cat_full_name
        helperString = self.categoryArray[row].cat_short_name
        
        self.dropDown.isHidden = true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.categoryTextField {
            
            self.dropDown.isHidden = false
            
            // If you don't want the users to see the keyboard while playing with PickerView.
            textField.endEditing(true)
            
        }
        
    }
    
    // Playing around with API.
    func parseData2() {
        
        // Making sure that the array is empty.
        categoryArray = []
        
        let url = URL(string: "http://xenottabyte.in/Xenotapp/school_api.php?ACTION=registrationCategory")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                
                do{
                    
                    let result = try JSONDecoder().decode(Categories.self, from: data!)
                    self.categoryArray = result.data
                    
                }catch{
                    
                    print(error)
                    
                }
                
                DispatchQueue.main.async {
                    
                    self.dropDown.reloadComponent(0)
                    
                }
                
            }
            
        }.resume()
        
    }
    
    // Registering the user to the API (post).
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        
        // Checking for valid inputs.
        if((schoolName.text?.isEmpty)! || (emailID.text?.isEmpty)! || (Password.text?.isEmpty)! || (phoneNumber.text?.isEmpty)!) || (categoryTextField.text?.isEmpty)! {
            
            let alert = UIAlertController.init(title: "Error", message: "Please fill in the details properly!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
    
        }
        
        // Send user data to server side
        let myUrl = NSURL(string:"http://xenottabyte.in/Xenotapp/school_api.php?ACTION=SRegistration");
        let request = NSMutableURLRequest(url: myUrl! as URL);
        request.httpMethod = "POST";
        
        let postString = "sname=\(schoolName.text!)&semail=\(emailID.text!)&spassword=\(String(describing: Password.text))&phone_number=\(String(describing: phoneNumber.text))&categories=\(String(describing: helperString))"
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if(error == nil) {
                print(response!)
                let alert = UIAlertController.init(title: "Registeration Successful!", message: "Press back and log in to your ID", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            
            else if error != nil {
                print("error=\(String(describing: error))")
                return
            }
            
            
          /*  var err: NSError? //?????????***
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                
                if let parseJSON = json {
                    let resultValue:String = parseJSON["status"] as! String;
                    print("result: \(resultValue)");
                    
                    if(resultValue == "Success"){
                        // Login is successful
                        UserDefaults.standard.set(true, forKey: "isUserLoggedIn");
                        
                        UserDefaults.standard.synchronize();
                        
                        self.dismiss(animated: true, completion: nil);
                    }
                }
                
                
            } catch let error as NSError {
                err = error
                print(err!)
            }*/
            
        }
        task.resume()
        
        
        
        
    }
    
    
    // Back button pressed.
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

// Make two structures.
struct Categories : Decodable {
    
    let data: [List2]
    
}

struct List2 : Decodable {
    
    let cat_full_name: String
    let cat_short_name: String
    
}


/* let params = ["sname": schoolName.text, "semail": emailID.text, "spassword": Password.text , "phone_number": phoneNumber.text , "categories": categoryTextField.text]
 
 guard let url = URL(string: "http://xenottabyte.in/Xenotapp/school_api.php?ACTION=SRegistration") else { return }
 var request = URLRequest(url: url)
 request.httpMethod = "POST"
 guard let httpBody = try?  JSONSerialization.data(withJSONObject: params, options: []) else { return }
 request.httpBody = httpBody
 
 let session = URLSession.shared
 session.dataTask(with: request) { (data, response, error) in
 if let response = response {
 print(response)
 }
 
 if let data = data {
 do{
 let json = try JSONSerialization.jsonObject(with: data, options: [])
 print(json)
 }
 catch {
 print(error)
 }
 }
 }.resume() */

   


