//
//  LoginTypeViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 20/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class LoginTypeViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var schoolView: UIView!
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        let helperVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterPageViewController") as! RegisterPageViewController
        //helperVC.delegate = self
        self.present(helperVC, animated: true, completion: nil)
    }
    
    @IBOutlet weak var coachingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolView.isUserInteractionEnabled = true
        let schoolTapped = UITapGestureRecognizer.init(target: self, action: #selector(schoolPageOpen))
        schoolTapped.delegate = self
        schoolView.addGestureRecognizer(schoolTapped)
        
        coachingView.isUserInteractionEnabled = true
        let coachingTapped = UITapGestureRecognizer.init(target: self, action: #selector(coachingPageOpen))
        coachingTapped.delegate = self
        coachingView.addGestureRecognizer(coachingTapped)
     
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func schoolPageOpen(){
        let helperVC2 = self.storyboard?.instantiateViewController(withIdentifier: "LoginPageViewController") as! LoginPageViewController
        //helperVC.delegate = self
        self.present(helperVC2, animated: true, completion: nil)
    }
    
    @objc func coachingPageOpen(){
        print("ay")
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
