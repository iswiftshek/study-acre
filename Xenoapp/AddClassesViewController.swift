//
//  AddClassesViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 22/06/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

protocol addNewClassDelegate {
    func parseData()
}

class AddClassesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    //let helperObject = ViewClassViewController()
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        let myUrl = NSURL(string: "http://xenottabyte.in/Xenotapp/school_api.php?ACTION=AddClass")
        let request = NSMutableURLRequest(url: myUrl! as URL)
        request.httpMethod = "POST"
        
        //&className=8&f_section=A
        
        let postString = "className=\(classTextField.text!)&f_section=\(sectionTextField.text!)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if(error == nil) {
                print(response!)
                //self.helperObject.parseData()
                let alert = UIAlertController.init(title: "Done", message: "Class added successfully!!!", preferredStyle: UIAlertControllerStyle.alert)
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
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    

    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var sectionTextField: UITextField!
    @IBOutlet weak var addClassLabel: UILabel!
    
    var delegate : addNewClassDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionTextField.delegate = self
        classTextField.delegate = self
        
        addClassLabel.font = addClassLabel.font.withSize(UIScreen.main.bounds.height/18.4)
        // Do any additional setup after loading the view.
    }
    
    // Dismissing the keyboard.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == classTextField {
            
            sectionTextField.becomeFirstResponder()
            
        }
        
        else if textField == sectionTextField {
            
            textField.resignFirstResponder()
            
        }
        return true
    }

}
