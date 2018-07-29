//
//  CoachingAdminViewTeacherViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 23/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit



class CoachingAdminViewTeacherViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
 var boolHelp = false
    var boolHelp2 = false
    
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if deleteButton.currentImage == UIImage(named: "whitetick") {
            
        
        if let cell = collectionViewTable?.cellForItem(at: indexPath) as? ViewTeachersCollectionViewCell {
            
           
           
            let inputAlert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this faculty?", preferredStyle: .alert)
            inputAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action:UIAlertAction) in
                
                
                let myUrl = NSURL(string: "http://xenottabyte.in/XenotappDesign/coaching_api.php?ACTION=DeleteEmployee&sluid=XSH81351")
                let request = NSMutableURLRequest(url: myUrl! as URL)
                request.httpMethod = "POST"
                
                
                let postString = "emp_uid=\(cell.emp_uid)"
                request.httpBody = postString.data(using: String.Encoding.utf8)
                
                let task = URLSession.shared.dataTask(with: request as URLRequest){
                    data, response, error in
                    
                    if(error == nil) {
                        print(response!)
                        self.boolHelp = true
                        self.alertHelper()
                        self.deleteEditingDone()
                        self.parseData()
                        
                    }
                        
                    else if error != nil {
                        print("error=\(String(describing: error))")
                        self.boolHelp = false
                        self.alertHelper()
                        return
                    }
                }
                task.resume()
                
                
            }))
            
            
            inputAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(inputAlert, animated: true, completion: nil)
            
            
        }
        
        }
    }
    
    func alertHelper2() {
        if boolHelp2 == true {
            
            
            let alert3 = UIAlertController(title: "Done", message: "The faculty was added.", preferredStyle: .alert)
            alert3.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert3, animated: true, completion: nil)
        }
        else {
            let alert4 = UIAlertController(title: "Error", message: "Oops! Some error was encountered.", preferredStyle: .alert)
            alert4.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert4, animated: true, completion: nil)
            
        }
        boolHelp2 = false
    }
    
    func alertHelper() {
        if boolHelp == true {
            DispatchQueue.main.async {
                self.addButton.isEnabled = false
                self.deleteButton.setImage(UIImage(named: "dustbin"), for: .normal)
                self.addButton.isEnabled = true
                if let indexPaths = self.collectionViewTable?.indexPathsForVisibleItems {
                    
                    for indexPath in indexPaths {
                        if let cell = self.collectionViewTable?.cellForItem(at: indexPath) as? ViewTeachersCollectionViewCell {
                            if cell.nameLabel.text != "Press (+) to add a faculty" {
                                cell.editingDone()
                            }
                        }
                        
                    }
                }
            }
            
            let alert = UIAlertController(title: "Done", message: "The faculty was deleted.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let alert2 = UIAlertController(title: "Error", message: "Oops! Some error was encountered.", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert2, animated: true, completion: nil)
            
        }
        boolHelp = false
    }
    
    func deleteEditingHelp(){
        if let indexPaths = collectionViewTable?.indexPathsForVisibleItems {
            addButton.isEnabled = false
            deleteButton.setImage(UIImage(named: "whitetick"), for: .normal)
            
            for indexPath in indexPaths {
                if let cell = collectionViewTable?.cellForItem(at: indexPath) as? ViewTeachersCollectionViewCell {
                    if cell.nameLabel.text != "Press (+) to add a faculty" {
                    cell.editingInProgress()
                    }}
                
            }
        }
        
    }
    
  
    
    func deleteEditingDone(){
        addButton.isEnabled = false
        deleteButton.setImage(UIImage(named: "dustbin"), for: .normal)
        addButton.isEnabled = true
        if let indexPaths = collectionViewTable?.indexPathsForVisibleItems {
            
            for indexPath in indexPaths {
                if let cell = collectionViewTable?.cellForItem(at: indexPath) as? ViewTeachersCollectionViewCell {
                    if cell.nameLabel.text != "Press (+) to add a faculty" {
                    cell.editingDone()
                    }
                }
                
            }
        }
        
    }
    
    
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        if deleteButton.currentImage == UIImage(named: "dustbin") {
        
        deleteEditingHelp()
            
        }
        else {
            
            deleteEditingDone()
            
            
            
            
        }
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        let inputAlert = UIAlertController(title: "New Faculty", message: "Add the details", preferredStyle: .alert)
        inputAlert.addTextField { (textfield:UITextField) in
            textfield.placeholder = "Name"
        }
        inputAlert.addTextField { (textfield:UITextField) in
            textfield.placeholder = "E-mail ID"
        }
        inputAlert.addTextField { (textfield:UITextField) in
            textfield.placeholder = "Phone Number"
        }
        inputAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action:UIAlertAction) in
            let nameTextField = inputAlert.textFields![0] as UITextField
            let emailID = inputAlert.textFields![1] as UITextField
            let phoneNumber = inputAlert.textFields![2] as UITextField
            
            let myUrl = NSURL(string: "http://xenottabyte.in/XenotappDesign/coaching_api.php?ACTION=AddEmp&sluid=XSH81351")
            let request = NSMutableURLRequest(url: myUrl! as URL)
            request.httpMethod = "POST"
    
            
            let postString = "fa_ad_name[0]=\(nameTextField.text!)&fa_ad_email[0]=\(emailID.text!)&fa_ad_phone[0]=\(phoneNumber.text!)"
            
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                
                if(error == nil) {
                    print(response!)
                    self.boolHelp2 = true
                    self.alertHelper2()
                   self.parseData()
                }
                    
                else if error != nil {
                    self.boolHelp2 = false
                    self.alertHelper2()
                    print("error=\(String(describing: error))")
                    return
                }
            }
            task.resume()
            
            
        }))
        
        inputAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(inputAlert, animated: true, completion: nil)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ArrayArr.count == 0 {
            return 1
        }
        return ArrayArr.count
    }
    
  //  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     //
    //}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if ArrayArr.count == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTV3", for: indexPath) as! ViewTeachersCollectionViewCell
            // cell.name.text = "Class: \(ArrayArr[indexPath.row].class_name)"
            cell.nameLabel.text = "Press (+) to add a faculty"
            self.deleteButton.isEnabled = false
            
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
        else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTV2", for: indexPath) as! ViewTeachersCollectionViewCell
       // cell.name.text = "Class: \(ArrayArr[indexPath.row].class_name)"
            cell.necessaryFunction()
        cell.nameLabel.text = "\(ArrayArr[indexPath.row].fa_name)"
            print(ArrayArr[indexPath.row].fa_name)
        cell.emp_uid = "\(ArrayArr[indexPath.row].fa_uid)"
            print(ArrayArr[indexPath.row].fa_uid)
            self.deleteButton.isEnabled = true
        
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
        
            
            return cell}
    }
     var ArrayArr = [List3]()
    

    @IBOutlet weak var collectionViewTable: UICollectionView!
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionViewTable.dataSource = self
        collectionViewTable.delegate = self
        parseData()
        searchBar()

        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
   

    @IBOutlet weak var searchBarBar: UISearchBar!
    func searchBar() {
        searchBarBar.delegate = self
        searchBarBar.showsScopeBar = true
        searchBarBar.tintColor = UIColor.red
        searchBarBar.placeholder = "Search"
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""
        {
            parseData()
           deleteEditingDone()
        }
        else{
            deleteEditingDone()
            ArrayArr = ArrayArr.filter({ (List3) -> Bool in
                List3.fa_name.lowercased().contains(searchText.lowercased())
            })
        }
        self.collectionViewTable.reloadData()
        //parseData()
    }
    
    
    func parseData() {
        
        
        
        
        
        let url = "http://xenottabyte.in/XenotappDesign/coaching_api.php?ACTION=ViewFaculty&sluid=XSH81351"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print(error!)
            }
            else {
                
                do {
                    
                    let fetchedData = try JSONDecoder().decode(Classes.self, from: data!)
                    self.ArrayArr = fetchedData.data
                    print(self.ArrayArr)
                    if self.deleteButton.currentImage == UIImage(named: "whitetick") {
                        self.deleteEditingHelp()
                    }; self.collectionViewTable.reloadData()
                    if self.self.deleteButton.currentImage == UIImage(named: "whitetick") {
                        self.deleteEditingHelp()
                    }
                    
                }
                    
                catch {
                    print("Error")
                }
            }
            
        }
        task.resume()
      
        
        
    }
    
    // Dismissing the keyboard.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    struct Classes : Decodable {
        let data: [List3]
    }
    
    struct List3 : Decodable {
        let id: String
        let fa_name: String
        let fa_uid: String
        let fa_password: String
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
