//
//  LoginPageViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 13/06/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit
import QuartzCore

class LoginPageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
@IBOutlet weak var passwordButton: UITextField!
@IBOutlet weak var emailID: UITextField!
@IBOutlet var loginButton: UIButton!
@IBOutlet weak var loginType: UITextField!
@IBOutlet weak var dropDown: UIPickerView!
    
    var loginTypeOptions = [List]()
    var stat: String = ""
    var helperString: String = ""
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        // Calling the "parse" function to use the API.
        parseData()
        
        // Declaring delegates for keyboard return funcitonality.
        emailID.delegate = self
        passwordButton.delegate = self
        dropDown.delegate = self
        dropDown.dataSource = self
        self.loginType.delegate = self
        
        // Hide the picker view when the app starts.
        self.dropDown.isHidden = true
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        
        // Checking for valid inputs.
        if((emailID.text?.isEmpty)! || (passwordButton.text?.isEmpty)! || (loginType.text?.isEmpty)!) {
            
            let alert = UIAlertController.init(title: "Error", message: "Please fill in the details properly!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
            //http://xenottabyte.in/Xenotapp/school_api.php?ACTION=Login&sluid
        }
        
        // Send user data to server side
        let myUrl = NSURL(string:"http://xenottabyte.in/Xenotapp/school_api.php?ACTION=Login");
        let request = NSMutableURLRequest(url: myUrl! as URL);
        request.httpMethod = "POST";
        
        let postString = "sluid=\(emailID.text!)&slpassword=\(passwordButton.text!)&login_type=\(loginType.text!)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
           /* if(error == nil) {
                print(response!)
                let alert = UIAlertController.init(title: "Done", message: "Login Successful!!!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }*/
                
            if error != nil {
                print("error=\(String(describing: error))")
                return
            }
            
            var err: NSError? //?????????***
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                if let parseJSON = json {
                    //print(parseJSON["stat"])
                    self.stat = parseJSON["stat"] as! String
                    
                    if(self.stat == "0") {
                        let alert = UIAlertController.init(title: "Error", message: "Please fill in the details properly!", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        return
                    }
                    
                    let resultValue:String = parseJSON["message"] as! String
                    print("result: \(resultValue)")
                    self.helperString = "\(resultValue)"
                    
                    DispatchQueue.main.async {
                        
                        if self.stat == "1" {
                            self.performSegue(withIdentifier: self.loginType.text!, sender: self)
                        }
                    }
                    
                }
                
                
            } catch let error as NSError {
                err = error
                print(err!)
            }
        
        }
        task.resume()
        
    }
    
   
    
    // Dismissing the keyboard.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    // Implementing the return functionality of keybpard.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailID {
            
            passwordButton.becomeFirstResponder()
            
        }
        else if textField == passwordButton {
            
            textField.resignFirstResponder()
            
        }
        else if textField == loginType {
            
            textField.resignFirstResponder()
            
        }
        return true
        
    }
    
    
    // Setting up the PickerView.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
 
        return loginTypeOptions.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return loginTypeOptions[row].login_type_name
        //return ""
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.loginType.text = self.loginTypeOptions[row].login_type_name
        self.dropDown.isHidden = true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.loginType {
            
            self.dropDown.isHidden = false
            // If you don't want the users to see the keyboard while playing with PickerView.
            textField.endEditing(true)
            
        }
        
    }
   
    // Playing around with API.
    func parseData() {
        
        // Making sure that the array is empty.
        loginTypeOptions = []
        
        let url = URL(string: "http://xenottabyte.in/Xenotapp/school_api.php?ACTION=logiN_type")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                
                do{
                    
                    let result = try JSONDecoder().decode(LoginType.self, from: data!)
                    self.loginTypeOptions = result.data
                   
                }catch{
                    
                    print(error)
                    
                }
                
                DispatchQueue.main.async {
                    
                    self.dropDown.reloadComponent(0)
                    
                }
                
            }
            
        }.resume()
        
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
            if loginType.text == "ORGANIZATION" {
                if segue.identifier == "ORGANIZATION" {
                    let adminVC = segue.destination as! AdminIDViewController
                    
                    adminVC.delegateAdmin = self as? adminDelegate
                    adminVC.labelText = "Last Visited: \(helperString)"
                    
                    
                    
                }
                
            }
            else if loginType.text == "PARENTS" {
                if segue.identifier == "PARENTS" {
                    let parentsVC = segue.destination as! ParentIDViewController
                    parentsVC.delegateParent = self as? parentDelegate
                }
                
            }
            else if loginType.text == "STUDENT" {
                if segue.identifier == "STUDENT" {
                    let studentVC = segue.destination as! StudentIDViewController
                    studentVC.delegateStudent = self as? studentDelegate
                    
                }
                
            }
            else if loginType.text == "FACULTY" {
                if segue.identifier == "FACULTY" {
                    let facultyVC = segue.destination as! FacultyIDViewController
                    facultyVC.delegateFaculty = self as? facultyDelegate
                }
            
            
        }
        
        
        if segue.identifier == "transition1" {
            let registerVC = segue.destination as! RegisterPageViewController
            
            registerVC.delegate = self as? registerNewUserDelegate
        }
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ORGANIZATION" {
            let adminVC = segue.destination as! AdminIDViewController
            
            adminVC.delegateAdmin = self as? adminDelegate
            
            
        }
        if segue.identifier == "transition1" {
            let registerVC = segue.destination as! RegisterPageViewController
            
            registerVC.delegate = self as? registerNewUserDelegate
        }
    }*/
    
    // Prepare for Segue method.
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if self.stat == "1" {
            if loginType.text == "ORGANIZATION" {
                if segue.identifier == "ORGANIZATION" {
                    let adminVC = segue.destination as! AdminIDViewController
                    
                    adminVC.delegateAdmin = self as! adminDelegate
                    
                    
                    
                }
                
            }
            else if loginType.text == "PARENTS" {
                if segue.identifier == "PARENTS" {
                    let parentsVC = segue.destination as! ParentIDViewController
                    parentsVC.delegateParent = self as! parentDelegate
                }
                
            }
            else if loginType.text == "STUDENT" {
                if segue.identifier == "STUDENT" {
                    let studentVC = segue.destination as! StudentIDViewController
                    studentVC.delegateStudent = self as! studentDelegate
                    
                }
                
            }
            else if loginType.text == "FACULTY" {
                if segue.identifier == "FACULTY" {
                    let facultyVC = segue.destination as! FacultyIDViewController
                    facultyVC.delegateFaculty = self as! facultyDelegate
                }
            }
            
        }
        
        
        if segue.identifier == "transition1" {
            let registerVC = segue.destination as! RegisterPageViewController
            
            registerVC.delegate = self as? registerNewUserDelegate
        }
    }*/
    
}

struct LoginType : Decodable {
    
    let data: [List]
}

struct List : Decodable {
    
    let login_type_name: String
}



// For making the login button look cool.
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        
        set {
            
            layer.borderWidth = newValue
        
        }
        
        get {
            
            return layer.borderWidth
        
        }
    
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            
            layer.cornerRadius = newValue
        
        }
        
        get {
            
            return layer.cornerRadius
        
        }
    
    }
    
    @IBInspectable var borderColor: UIColor? {
        
        set {
            
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
            
        }
        
        get {
            
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
            
        }
    
    }

}
