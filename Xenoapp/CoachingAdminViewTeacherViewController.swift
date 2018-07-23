//
//  CoachingAdminViewTeacherViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 23/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class CoachingAdminViewTeacherViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ArrayArr.count == 0 {
            return 1
        }
        return ArrayArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if ArrayArr.count == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTV3", for: indexPath) as! ViewTeachersCollectionViewCell
            // cell.name.text = "Class: \(ArrayArr[indexPath.row].class_name)"
            cell.nameLabel.text = "Press (+) to add a faculty"
            
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
        cell.nameLabel.text = "\(ArrayArr[indexPath.row].fa_name)"
        
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
        }
        else{
            ArrayArr = ArrayArr.filter({ (List3) -> Bool in
                List3.fa_name.lowercased().contains(searchText.lowercased())
            })
        }
        self.collectionViewTable.reloadData()
    }
    
    
    func parseData() {
        
        
        
        let url = "http://xenottabyte.in/XenotappDesign/coaching_api.php?ACTION=ViewFaculty&sluid=XENO71012"
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
                    self.collectionViewTable.reloadData()
                    
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
