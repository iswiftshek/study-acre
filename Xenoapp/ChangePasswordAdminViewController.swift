//
//  ChangePasswordAdminViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 14/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class ChangePasswordAdminViewController: UIViewController, UITextFieldDelegate {

    @IBAction func submitButtonPressed(_ sender: Any) {
        
        
        if newPasswordTextField.text != confirmNewPasswordTextField.text! {
            let alert = UIAlertController.init(title: "Error", message: "Passwords do not match!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        // Send user data to server side
        let myUrl = NSURL(string:"http://xenottabyte.in/XenotappDesign/coaching_api.php?ACTION=ChangePassword");
        let request = NSMutableURLRequest(url: myUrl! as URL);
        request.httpMethod = "POST";
        
        let postString = "curr_password=\(currentPasswordTextField.text!)&new_password=\(newPasswordTextField.text!)&confirm_newpassword=\(confirmNewPasswordTextField.text!)&sluid=XSH81351"
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if(error == nil) {
                print(response!)
                let alert = UIAlertController.init(title: "Done", message: "Password changed successfully!!!", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
                
            else if error != nil {
                print("error=\(String(describing: error))")
                return
            }
        }
        task.resume()
        
    }
    @IBOutlet weak var confirmNewPasswordLabel: UILabel!
    @IBOutlet weak var newPasswordLabel: UILabel!
    @IBOutlet weak var currentPasswordLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var currentPasswordTextField: UITextField!
    
    // Dismissing the keyboard.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    // Implementing the return functionality of keybpard.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == currentPasswordTextField {
            
            newPasswordTextField.becomeFirstResponder()
            
        }
        else if textField == newPasswordTextField {
            
            confirmNewPasswordTextField.becomeFirstResponder()
            
        }
        else if textField == confirmNewPasswordTextField {
            
            textField.resignFirstResponder()
            
        }
        
        return true
        
    }
    
    override func viewDidLoad() {
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
        //gradient.locations = [0.4, 0.5]
        self.view.layer.insertSublayer(gradient, at: 0)
        super.viewDidLoad()
        
        currentPasswordLabel.font = currentPasswordLabel.font.withSize(UIScreen.main.bounds.height/36.8)
        newPasswordLabel.font = newPasswordLabel.font.withSize(UIScreen.main.bounds.height/36.8)
        confirmNewPasswordLabel.font = confirmNewPasswordLabel.font.withSize(UIScreen.main.bounds.height/36.8)
        currentPasswordTextField.font = currentPasswordTextField.font?.withSize(UIScreen.main.bounds.height/36.8)
        newPasswordTextField.font = newPasswordTextField.font?.withSize(UIScreen.main.bounds.height/36.8)
        confirmNewPasswordTextField.font = confirmNewPasswordTextField.font?.withSize(UIScreen.main.bounds.height/36.8)
        
        submitButton.titleLabel?.font = submitButton.titleLabel?.font.withSize(UIScreen.main.bounds.height/33.45)
        
        
        currentPasswordTextField.delegate = self
        newPasswordTextField.delegate = self
        confirmNewPasswordTextField.delegate = self
         self.submitButton.backgroundColor = UIColor.lightGray
        submitButton.isEnabled = false
        confirmNewPasswordTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        newPasswordTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        currentPasswordTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        btnMenuButton.target = revealViewController()
        btnMenuButton.action =  #selector(SWRevealViewController.revealToggle(_:))

        // Do any additional setup after loading the view.
    }
    
    @objc func editingChanged(sender: UITextField) {
       sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        guard
            let newPassword = newPasswordTextField.text, !newPassword.isEmpty,
            let confirmNewPassword = confirmNewPasswordTextField.text, !confirmNewPassword.isEmpty,
            let currentPassword = currentPasswordTextField.text, !currentPassword.isEmpty
            else {
                self.submitButton.isEnabled = false
                self.submitButton.backgroundColor = UIColor.lightGray
                return
        }
        self.submitButton.isEnabled = true
        self.submitButton.backgroundColor = UIColor.red
    }
    
   
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!

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

}
