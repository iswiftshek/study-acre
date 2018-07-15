//
//  AdminHelpViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 15/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit
import MessageUI

class AdminHelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!

    @IBOutlet weak var tableViewHelp: UITableView!
    var menuNameArr:Array = [String]()
    var menuName2Arr:Array = [String]()
    var iconImage:Array = [UIImage]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdminHelpTableViewCell", for: indexPath) as! AdminHelpTableViewCell
        cell.imageIcon.image = iconImage[indexPath.row]
        cell.Label1.text! = menuNameArr[indexPath.row]
        cell.Label2.text! = menuName2Arr[indexPath.row]
        cell.backgroundColor = UIColor.clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController:SWRevealViewController = self.revealViewController()
        let cell:AdminHelpTableViewCell = tableView.cellForRow(at: indexPath) as! AdminHelpTableViewCell
        if cell.Label1.text == "Customer Service" {
            
            let url: NSURL = URL(string: "TEL://9824376841") as! NSURL
            UIApplication.shared.open(url as URL, options: [:]) { (true) in
                
                let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "AdminHelpViewController") as! AdminHelpViewController
                let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
                revealViewController.pushFrontViewController(newFrontController, animated: true)
                
            }
            
            
        }
        if cell.Label1.text == "Email ID" {
            let mailCompose = MFMailComposeViewController()
            mailCompose.mailComposeDelegate = self
            mailCompose.setToRecipients(["flashthespeedster@gmail.com"])
            
            if MFMailComposeViewController.canSendMail() {
                self.present(mailCompose, animated: true, completion: nil)
            }
            else {
               return
            }
        }
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "AdminHelpViewController") as! AdminHelpViewController
        let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
        revealViewController().pushFrontViewController(newFrontController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableViewHelp.backgroundColor = UIColor.clear
        self.tableViewHelp.alwaysBounceVertical = false
        
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
        //gradient.locations = [0.4, 0.5]
        self.view.layer.insertSublayer(gradient, at: 0)
        btnMenuButton.target = revealViewController()
        btnMenuButton.action =  #selector(SWRevealViewController.revealToggle(_:))
        
        menuNameArr = ["Customer Service", "Email ID"]
        menuName2Arr = ["9824376841", "flashthespeedster@gmail.com"]
        
        iconImage = [UIImage(named: "help1")!,UIImage(named: "help2")!]
        

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
