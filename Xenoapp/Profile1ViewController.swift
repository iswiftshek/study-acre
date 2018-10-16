//
//  Profile1ViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 28/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class Profile1ViewController: UIViewController {

   
    @IBAction func backButtonPressed(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "SWRevealViewController3") 
        newViewcontroller.modalTransitionStyle = .flipHorizontal
       // let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
       // newFrontController.modalTransitionStyle = .flipHorizontal
       // revealViewController().pushFrontViewController(newFrontController, animated: true)
        self.present(newViewcontroller, animated: true, completion: nil)
    }
    @IBOutlet weak var genderTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
  
       

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


