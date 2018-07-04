//
//  GroupViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 29/06/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {
    
    @IBOutlet weak var classGroup: UIButton!
    
    @IBOutlet weak var applicationForPgs: UIButton!
    
    @IBOutlet weak var privateGroups: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applicationForPgs.titleLabel?.font = applicationForPgs.titleLabel?.font.withSize(UIScreen.main.bounds.height/26)
        
        privateGroups.titleLabel?.font = privateGroups.titleLabel?.font.withSize(UIScreen.main.bounds.height/24.5)

        classGroup.titleLabel?.font = classGroup.titleLabel?.font.withSize(UIScreen.main.bounds.height/24.5)


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
