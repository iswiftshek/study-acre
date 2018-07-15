//
//  TeachersMenuViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 09/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class TeachersMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailIDLabel: UILabel!
    
    var menuNameArr:Array = [String]()
    var iconImage:Array = [UIImage]()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeachersMenuTableViewCell", for: indexPath) as! TeachersMenuTableViewCell
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
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "CoachingTeacherViewController") as! CoachingTeacherViewController
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
        
        pictureImage.frame.size.height = UIScreen.main.bounds.height/8.558
        pictureImage.frame.size.width
            = UIScreen.main.bounds.height/8.558
        
        if UIScreen.main.bounds.height == 568 {
            var frm: CGRect = pictureImage.frame
            frm.origin.y = frm.origin.y + 200
            pictureImage.frame = frm
        }
        
        nameLabel.font = nameLabel.font.withSize(UIScreen.main.bounds.height/43.29)
        emailIDLabel.font = emailIDLabel.font.withSize(UIScreen.main.bounds.height/56.61)
        
        menuNameArr = ["Profile","My Batches", "About Institute","My Salary","Feedback","Help","Refer a friend"]
        iconImage = [UIImage(named: "Profile")!,UIImage(named: "My Batches")!,UIImage(named: "About Institute")!,UIImage(named: "My Salary")!,UIImage(named: "Feedback")!,UIImage(named: "Help")!,UIImage(named: "Refer a friend")!]

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
