//
//  AddSubjectViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 22/06/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class AddSubjectViewController: UIViewController, UITextFieldDelegate {

   
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var addSubjectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subjectTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    // Dismissing the keyboard.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == subjectTextField {
            
            textField.resignFirstResponder()
            
        }
        return true
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

}
