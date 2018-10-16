//
//  LoginCoachingViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 17/08/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class LoginCoachingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginType: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var dropDown: UIPickerView!
    
    var loginTypeOptions = [ListC]()
    var stat: String = ""
    var helperString: String = ""
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "SWRevealViewController3")
        newViewcontroller.modalTransitionStyle = .flipHorizontal
        // let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
        // newFrontController.modalTransitionStyle = .flipHorizontal
        // revealViewController().pushFrontViewController(newFrontController, animated: true)
        self.present(newViewcontroller, animated: true, completion: nil)
        
        return
        
        
        // Checking for valid inputs.
        if((emailID.text?.isEmpty)! || (passwordField.text?.isEmpty)! || (loginType.text?.isEmpty)!) {
            
            let alert = UIAlertController.init(title: "Error", message: "Please fill in the details properly!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
            
        }
        
        // Send user data to server side
        let myUrl = NSURL(string:"http://xenottabyte.in/XenotappWorking/coaching_api.php?ACTION=Login");
        let request = NSMutableURLRequest(url: myUrl! as URL);
        request.httpMethod = "POST";
        
        let postString = "sluid=\(emailID.text!)&slpassword=\(passwordField.text!)&login_type=\(loginType.text!)"
        
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
                            print("helloMATE")
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
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calling the "parse" function to use the API.
        parseData()
        
        // Declaring delegates for keyboard return funcitonality.
        emailID.delegate = self
        passwordField.delegate = self
        dropDown.delegate = self
        dropDown.dataSource = self
        self.loginType.delegate = self
        
        // Hide the picker view when the app starts.
        self.dropDown.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Dismissing the keyboard.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    // Implementing the return functionality of keybpard.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailID {
            
            passwordField.becomeFirstResponder()
            
        }
        else if textField == passwordField {
            
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
    
    func parseData() {
        
        // Making sure that the array is empty.
        loginTypeOptions = []
        
        let url = URL(string: "http://xenottabyte.in/XenotappDesign/coaching_api.php?ACTION=LoginType")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                
                do{
                    
                    let result = try JSONDecoder().decode(LoginType2.self, from: data!)
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
    

}

struct LoginType2 : Decodable {
    
    let data: [ListC]
}

struct ListC : Decodable {
    
    let login_type_name: String
}
