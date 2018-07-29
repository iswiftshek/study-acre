//
//  CoachingAddFacultyViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 24/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

//http://xenottabyte.in/XenotappDesign/coaching_api.php?ACTION=AddEmp&sluid=XENO71012&fa_ad_name=''&fa_ad_email=''&fa_ad_phone=''

class CoachingAddFacultyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var addFieldButton: UIButton!
    
   
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        
        
        let myUrl = NSURL(string: "http://xenottabyte.in/XenotappDesign/coaching_api.php?ACTION=AddEmp")
        let request = NSMutableURLRequest(url: myUrl! as URL)
        request.httpMethod = "POST"
        
        //&className=8&f_section=A
        
     //   let postString = "sluid=XSH81351&fa_ad_name=\(sectionTextField.text!)"
        
        //request.httpBody = postString.data(using: String.Encoding.utf8)
        
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
    
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        helperNumber = helperNumber - 1
        if helperNumber <= 1 {
            deleteButton.isEnabled = false
            deleteButton.backgroundColor = UIColor.lightGray
           
        }
        else {
            deleteButton.backgroundColor = addFieldButton.backgroundColor
        }
         deleteButton.borderColor = deleteButton.backgroundColor
        self.myCollectionView.reloadData()
        
    }
    @IBAction func addFieldPressed(_ sender: Any) {
        helperNumber = helperNumber + 1
        deleteButton.isEnabled = true
        deleteButton.borderColor = addFieldButton.backgroundColor
        deleteButton.backgroundColor = deleteButton.borderColor
        
        self.myCollectionView.reloadData()
    }
    @IBOutlet weak var myCollectionView: UICollectionView!
    var helperNumber = 1
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return helperNumber
        
    }
    
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellT1", for: indexPath) as! AddTeacherCollectionViewCell
        // cell.name.text = "Class: \(ArrayArr[indexPath.row].class_name)"
        self.myCollectionView.backgroundColor = UIColor.clear
        cell.layer.cornerRadius = 5.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
        
        return cell
        
    }
  
    
    @IBOutlet weak var deleteButton: UIButton!
    // Dismissing the keyboard.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if helperNumber <= 1 {
            deleteButton.isEnabled = false
            deleteButton.backgroundColor = UIColor.lightGray
            
        }
        else {
            deleteButton.backgroundColor = addFieldButton.backgroundColor
        }
        deleteButton.borderColor = deleteButton.backgroundColor
       

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

}
