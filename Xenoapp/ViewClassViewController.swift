//
//  ViewClassViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 23/06/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

// Setting up the protocol for the segue transition.
protocol viewClassesDelegate {
    func helperFunction()
}

class ViewClassViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var delegate : viewClassesDelegate?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTV")
        cell?.textLabel?.text = "Class: \(ArrayArr[indexPath.row].class_name)"
        cell?.detailTextLabel?.text = "Section: \(ArrayArr[indexPath.row].section)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrayArr.count
    }
    
    
    var ArrayArr = [List3]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        parseData()
        searchBar()
        
        topView.frame.size.height = UIScreen.main.bounds.height/14.43

        // Do any additional setup after loading the view.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func searchBar() {
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width , height: 50))
        searchBar.delegate = self
        searchBar.showsScopeBar = true
        searchBar.tintColor = UIColor.lightGray
        searchBar.scopeButtonTitles = ["Class", "Section"]
        self.tableView.tableHeaderView = searchBar
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""
        {
            parseData()
        }
        else{
            if searchBar.selectedScopeButtonIndex == 0 {
                ArrayArr = ArrayArr.filter({ (List3) -> Bool in
                    return List3.class_name.lowercased().contains(searchText.lowercased())
                })
            }
            else {
                ArrayArr = ArrayArr.filter({ (List3) -> Bool in
                    return List3.section.lowercased().contains(searchText.lowercased())
                })
                
            }
        }
        self.tableView.reloadData()
    }
    
    // Dismissing the keyboard.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func parseData() {
        
      
        
        let url = "http://xenottabyte.in/Xenotapp/school_api.php?ACTION=ViewClass"
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
                    self.tableView.reloadData()
                    
                }
            
                catch {
                    print("Error")
                }
            }
            
        }
        task.resume()
        
        
    }
    
    // Prepare for Segue method.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "transition2" {
            let addVC = segue.destination as! AddClassesViewController
            
            addVC.delegate = self as? addNewClassDelegate
        }
    }
    

}

struct Classes : Decodable {
    let data: [List3]
}

struct List3 : Decodable {
    let class_name: String
    let section: String
}












