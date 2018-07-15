//
//  StudentMenuViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 10/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class StudentMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var menuNameArr:Array = [String]()
    var iconImage:Array = [UIImage]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentsMenuTableViewCell", for: indexPath) as! TeachersMenuTableViewCell
        cell.imgIcon.image = iconImage[indexPath.row]
        cell.lblMenuName.text! = menuNameArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController:SWRevealViewController = self.revealViewController()
        let cell:TeachersMenuTableViewCell = tableView.cellForRow(at: indexPath) as! TeachersMenuTableViewCell
        if cell.lblMenuName.text! == "Profile"
        {
            
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "CoachingStudentViewController") as! CoachingStudentViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealViewController.pushFrontViewController(newFrontController, animated: true)
            
        }
        if cell.lblMenuName.text! == "Feedback"
        {
            
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "FeedbackTeacherViewController") as! FeedbackTeacherViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealViewController.pushFrontViewController(newFrontController, animated: true)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()

gradient.frame = self.view.bounds
 gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
        gradient.locations = [0.0,0.35]
 
self.view.layer.insertSublayer(gradient, at: 0)
        
        photoID2.frame.size.height = UIScreen.main.bounds.height/8.558
        photoID2.frame.size.width
            = UIScreen.main.bounds.height/8.558
        
        if UIScreen.main.bounds.height == 568 {
            var frm: CGRect = photoID2.frame
            frm.origin.y = frm.origin.y + 200
            photoID2.frame = frm
        }
        
        nameLabel2.font = nameLabel2.font.withSize(UIScreen.main.bounds.height/43.29)
        emailIDLabel2.font = emailIDLabel2.font.withSize(UIScreen.main.bounds.height/56.61)
        
        menuNameArr = ["Profile","My Teachers", "My Batches","Suggestion/Complain","Contact Institute","Contact StudyAcre","Change Password", "Logout"]
        iconImage = [UIImage(named: "sProfile")!, UIImage(named: "sMy Teachers")!,UIImage(named: "sMy Batches")!,UIImage(named: "sSuggestion")!,UIImage(named: "sContact Institute")!,UIImage(named: "sContact StudyAcre")!,UIImage(named: "sChange Password")!,UIImage(named: "sLogout")!]


        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var photoID2: UIImageView!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var emailIDLabel2: UILabel!
    
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
