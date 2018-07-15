//
//  CoachingStudentViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 08/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class CoachingStudentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var orangeViewC1: UIView!
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    @IBOutlet weak var helperViewGrad: UIView!
    @IBOutlet var viewColorGrad: UIView!
    @IBOutlet weak var myCollectionViewC1: UICollectionView!
    @IBOutlet weak var studyAcreLabel2: UILabel!
    
    let array1C1: [String] = ["wSyllabus","wTimeTable","wAttendance","wClassWork","wAssignment","wHomeWork","wRemarks"]
    let array2C1: [String] = ["Syllabus","TimeTable","Attendance","ClassWork","Assignment","HomeWork","Remarks"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         studyAcreLabel2.font = studyAcreLabel2.font.withSize(UIScreen.main.bounds.height/24.53)
        btnMenuButton.target = revealViewController()
        btnMenuButton.action =  #selector(SWRevealViewController.revealToggle(_:))
        
        var itemSize2: CGFloat
        
        if UIScreen.main.bounds.height == 568 {
            itemSize2 = UIScreen.main.bounds.width/2.5 - UIScreen.main.bounds.height/490.6666
            let layout2 = UICollectionViewFlowLayout()
            layout2.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15)
            layout2.itemSize = CGSize(width: itemSize2 + 8, height: itemSize2*5/6)
            layout2.minimumInteritemSpacing = 0
            layout2.minimumLineSpacing = 15
            myCollectionViewC1.collectionViewLayout = layout2
            
            //let gradient = CAGradientLayer()
            
            /*gradient.frame = myCollectionViewC1.bounds
            gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
            
            myCollectionViewC1.layer.insertSublayer(gradient, at: 0)
            */
            self.myCollectionViewC1.backgroundColor = UIColor.clear
            
            let gradient = CAGradientLayer()
            gradient.frame = self.view.bounds
            gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
            //gradient.locations = [0.4, 0.5]
            self.view.layer.insertSublayer(gradient, at: 0)
            let gradient2 = CAGradientLayer()
            gradient2.frame = self.orangeViewC1.bounds
            gradient2.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
            
            self.orangeViewC1.layer.insertSublayer(gradient2, at: 0)
            
        }
            
        else {
            itemSize2 = UIScreen.main.bounds.width/2.5
            let layout2 = UICollectionViewFlowLayout()
            layout2.sectionInset = UIEdgeInsetsMake(22, 22, 22, 22)
            layout2.itemSize = CGSize(width: itemSize2 + 8, height: itemSize2*5/6)
            layout2.minimumInteritemSpacing = 0
            layout2.minimumLineSpacing = 18
            myCollectionViewC1.collectionViewLayout = layout2
        
            self.myCollectionViewC1.backgroundColor = UIColor.clear
            
            let gradient = CAGradientLayer()
            gradient.frame = self.view.bounds
            gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
            //gradient.locations = [0.4, 0.5]
            self.view.layer.insertSublayer(gradient, at: 0)
            let gradient2 = CAGradientLayer()
            gradient2.frame = self.orangeViewC1.bounds
            gradient2.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
           
            self.orangeViewC1.layer.insertSublayer(gradient2, at: 0)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array1C1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = myCollectionViewC1.dequeueReusableCell(withReuseIdentifier: "cellW1", for: indexPath ) as! myCell2
        cell2.myImage2.image = UIImage(named: array1C1[indexPath.row])
        
        var frm: CGRect = cell2.myImage2.frame
        frm.origin.x = frm.origin.x
        frm.origin.y = frm.origin.y
        frm.size.width = UIScreen.main.bounds.height/14.72
        frm.size.height = UIScreen.main.bounds.height/14.72
        cell2.myImage2.frame = frm
        
        cell2.myLabel2.text = "\(array2C1[indexPath.row])"
        cell2.myLabel2.textColor = UIColor.white
        cell2.myLabel2.font = cell2.myLabel2.font.withSize(UIScreen.main.bounds.height/49.066666)
        
        cell2.layer.borderWidth = 0
        return cell2
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

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
