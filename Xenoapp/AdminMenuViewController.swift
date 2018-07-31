//
//  AdminMenuViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 12/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class AdminMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "CoachingAdminViewController") as! CoachingAdminViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealViewController.pushFrontViewController(newFrontController, animated: true)
            
        }
        if cell.lblMenuName.text! == "Refer a Friend" {
            
            let activityVC = UIActivityViewController(activityItems: ["Checkout StudyAcre App for managing your coaching institute in a digital way: www.xenottabyte.in"], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
            
        }
        if cell.lblMenuName.text! == "Profile Details" {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "AdminProfileViewController") as! AdminProfileViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealViewController.pushFrontViewController(newFrontController, animated: true)
            
        }
        if cell.lblMenuName.text! == "Help"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "AdminHelpViewController") as! AdminHelpViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.lblMenuName.text! == "Change Password"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ChangePasswordAdminViewController") as! ChangePasswordAdminViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.lblMenuName.text! == "Feedback"
        {
            
            UIApplication.shared.openURL(NSURL(string:"https://goo.gl/forms/gMoc2g7a7RrZTqR12")! as URL)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
        gradient.locations = [0.0,0.35]
        
        self.view.layer.insertSublayer(gradient, at: 0)
        
        photoID3.frame.size.height = UIScreen.main.bounds.height/8.558
        photoID3.frame.size.width
            = UIScreen.main.bounds.height/8.558
        
        if UIScreen.main.bounds.height == 568 {
            var frm: CGRect = photoID3.frame
            frm.origin.y = frm.origin.y + 200
            photoID3.frame = frm
        }
        
        nameLabel3.font = nameLabel3.font.withSize(UIScreen.main.bounds.height/43.29)
        emailIDLabel3.font = emailIDLabel3.font.withSize(UIScreen.main.bounds.height/56.61)
        
        menuNameArr = ["Profile Details","Change Password", "Refer a Friend","Help","Feedback","Logout"]
        iconImage = [UIImage(named: "sProfile")!, UIImage(named: "gChange Password")!,UIImage(named: "gRefer a Friend")!,UIImage(named: "gHelp")!,UIImage(named: "gFeedback")!, UIImage(named: "sLogout")!]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var photoID3: UIImageView!
    @IBOutlet weak var nameLabel3: UILabel!
    @IBOutlet weak var emailIDLabel3: UILabel!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
