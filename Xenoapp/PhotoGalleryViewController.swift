//
//  PhotoGalleryViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 27/06/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class PhotoGalleryViewController: UIViewController {

    @IBOutlet weak var photoGalleryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //photoGalleryLabel.font = photoGalleryLabel.font.withSize(UIScreen.main.bounds.height/18.4)

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
