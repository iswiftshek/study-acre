//
//  CoachingAdminViewStudentViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 03/08/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class CoachingAdminViewStudentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    var boolHelp3 = false
    
    @IBAction func backButtonPressed(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
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
        
        let inputAlert = UIAlertController(title: "New Class", message: "Add the details", preferredStyle: .alert)
        inputAlert.addTextField { (textfield:UITextField) in
            textfield.placeholder = "Class Name"
        }
        inputAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action:UIAlertAction) in
            let nameTextField = inputAlert.textFields![0] as UITextField
           
            
            let myUrl = NSURL(string: "http://xenottabyte.in/XenotappWorking/coaching_api.php?ACTION=AddClasses&sluid=XENO65337")
            let request = NSMutableURLRequest(url: myUrl! as URL)
            request.httpMethod = "POST"
            
            
            let postString = "class_name=\(nameTextField.text!)"
            
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
    
    func alertHelper2() {
        if boolHelp2 == true {
            
            
            let alert3 = UIAlertController(title: "Done", message: "The class was added.", preferredStyle: .alert)
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
            
            let alert = UIAlertController(title: "Done", message: "The class was deleted.", preferredStyle: .alert)
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
    
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        if deleteButton.currentImage == UIImage(named: "whitetick") {
            if let cell = collectionViewTable?.cellForItem(at: indexPath) as? ViewTeachersCollectionViewCell {
                
               
                
                let inputAlert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this class?", preferredStyle: .alert)
                inputAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action:UIAlertAction) in
                    let myUrl = NSURL(string: "http://xenottabyte.in/XenotappWorking/coaching_api.php?ACTION=DeleteClass&sluid=XENO65337")
                    let request = NSMutableURLRequest(url: myUrl! as URL)
                    request.httpMethod = "POST"
                    
                    
                    let postString = "class_id=\(cell.emp_uid)"
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
            //http://xenottabyte.in/XenotappWorking/coaching_api.php?ACTION=UpdateClass&class_id=2&sluid=XENO65337&class_name=7
        else if editButton.currentImage == UIImage(named: "whitetick") {
            
             if let cell = collectionViewTable?.cellForItem(at: indexPath) as? ViewTeachersCollectionViewCell {
                
                let inputAlert = UIAlertController(title: "Update Class", message: "Add the new Class Name", preferredStyle: .alert)
                inputAlert.addTextField { (textfield:UITextField) in
                    textfield.placeholder = "Name"
                }
                
                inputAlert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (action:UIAlertAction) in
                    let nameTextField = inputAlert.textFields![0] as UITextField
                    
                    
                    let myUrl = NSURL(string: "http://xenottabyte.in/XenotappWorking/coaching_api.php?ACTION=UpdateClass&sluid=XENO65337")
                    let request = NSMutableURLRequest(url: myUrl! as URL)
                    request.httpMethod = "POST"
                    
                    
                    let postString = "class_id=\(cell.emp_uid)&class_name=\(nameTextField.text!)"
                    
                    request.httpBody = postString.data(using: String.Encoding.utf8)
                    
                    let task = URLSession.shared.dataTask(with: request as URLRequest){
                        data, response, error in
                        
                        if(error == nil) {
                            print(response!)
                            self.boolHelp3 = true
                            self.alertHelper3()
                            self.parseData()
                        }
                            
                        else if error != nil {
                            self.boolHelp3 = false
                            self.alertHelper3()
                            print("error=\(String(describing: error))")
                            return
                        }
                    }
                    task.resume()
                    
                    
                }))
                
                inputAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(inputAlert, animated: true, completion: nil)
                
                
                
            }
            
        }
            
        else {
            if let cell = collectionViewTable?.cellForItem(at: indexPath) as? ViewTeachersCollectionViewCell {
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CoachingAdminViewStudentViewStudentViewController") as! CoachingAdminViewStudentViewStudentViewController
                nextVC.className = cell.nameLabel.text!
                present(nextVC, animated: true, completion: nil)
            }
            
        }
    }
   
    func alertHelper3(){
        
        if boolHelp3 == true {
            
            
            let alert3 = UIAlertController(title: "Done", message: "The class was updated.", preferredStyle: .alert)
            alert3.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (abc) in
                self.editClassDone()
            }))
            self.present(alert3, animated: true, completion: nil)
        }
        else {
            let alert4 = UIAlertController(title: "Error", message: "Oops! Some error was encountered.", preferredStyle: .alert)
            alert4.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert4, animated: true, completion: nil)
            
        }
        boolHelp3 = false
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if ArrayArr.count == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTV5", for: indexPath) as! ViewTeachersCollectionViewCell
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTV4", for: indexPath) as! ViewTeachersCollectionViewCell
            // cell.name.text = "Class: \(ArrayArr[indexPath.row].class_name)"
            cell.necessaryFunction()
            cell.nameLabel.text = "\(ArrayArr[indexPath.row].coach_class)"
            cell.emp_uid = "\(ArrayArr[indexPath.row].id)"
            //print(ArrayArr[indexPath.row].fa_na)
            
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
    
    
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var boolHelp = false
    var boolHelp2 = false
    
    var ArrayArr = [List3]()

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
    @IBAction func editButtonPressed(_ sender: Any) {
        if editButton.currentImage == UIImage(named: "edit") {
            editClassHelp()
        }
        else {
            editClassDone()
           
        }
    }
    
    func editClassDone(){
        addButton.isEnabled = true
        deleteButton.isEnabled = true
        editButton.setImage(UIImage(named: "edit"), for: .normal)
        if let indexPaths = collectionViewTable?.indexPathsForVisibleItems {
            
            for indexPath in indexPaths {
                if let cell = collectionViewTable?.cellForItem(at: indexPath) as? ViewTeachersCollectionViewCell {
                    if cell.nameLabel.text != "Press (+) to add a faculty" {
                        cell.forwardArror.image = UIImage(named:"farrow")
                    }
                }
                
            }
        }
        
        
    }
    
    func editClassHelp(){
        if let indexPaths = collectionViewTable?.indexPathsForVisibleItems {
            addButton.isEnabled = false
            deleteButton.isEnabled = false
            editButton.setImage(UIImage(named:"whitetick"), for: .normal)
            for indexPath in indexPaths {
                if let cell = collectionViewTable?.cellForItem(at: indexPath) as? ViewTeachersCollectionViewCell {
                    if cell.nameLabel.text != "Press (+) to add a faculty" {
                        cell.forwardArror.image = UIImage(named: "editPencil")
                    }}
            }
        }
    }
    
    @IBOutlet weak var editButton: UIButton!
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""
        {
            parseData()
            deleteEditingDone()
        }
        else{
            deleteEditingDone()
            ArrayArr = ArrayArr.filter({ (List3) -> Bool in
                List3.coach_class.lowercased().contains(searchText.lowercased())
            })
        }
        self.collectionViewTable.reloadData()
        //parseData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ArrayArr.count == 0 {
            return 1
        }
        return ArrayArr.count
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
    
    
    @IBOutlet weak var collectionViewTable: UICollectionView!
    
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
    
    func parseData() {
        
        
        
        
        
        let url = "http://xenottabyte.in/XenotappWorking/coaching_api.php?ACTION=ViewClass&sluid=XENO65337"
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
        let coach_class: String
        
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
