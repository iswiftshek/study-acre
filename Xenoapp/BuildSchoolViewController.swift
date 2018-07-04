//
//  BuildSchoolViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 22/06/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class BuildSchoolViewController: UIViewController {

    @IBOutlet weak var viewSubjectsButton: UIButton!
    @IBOutlet weak var viewClassesButton: UIButton!
    @IBOutlet weak var buildSchoolLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildSchoolLabel.font = buildSchoolLabel.font.withSize(UIScreen.main.bounds.height/12.26)
        viewSubjectsButton.titleLabel?.font = viewSubjectsButton.titleLabel?.font.withSize(UIScreen.main.bounds.height/24.5)
        viewClassesButton.titleLabel?.font = viewClassesButton.titleLabel?.font.withSize(UIScreen.main.bounds.height/24.5)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func helperFunction() {
        
    }
    
    // Prepare for Segue method.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "2" {
            let viewClassVC = segue.destination as! ViewClassViewController
            
            viewClassVC.delegate = self as? viewClassesDelegate
        }
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
