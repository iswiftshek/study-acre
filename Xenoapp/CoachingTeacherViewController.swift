//
//  CoachingTeacherViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 08/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class CoachingTeacherViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var myCollectionViewC2: UICollectionView!
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    @IBOutlet weak var studyAcreLabel: UILabel!
    
    let array1C2: [String] = ["wTimeTable","wSyllabus", "wAttendance","wClassWork","wHomeWork","wAssignment"]
    let array2C2: [String] = ["My Schedule","TimeTable","Attendance","ClassWork","HomeWork", "Assignment"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studyAcreLabel.font = studyAcreLabel.font.withSize(UIScreen.main.bounds.height/24.53)
        
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
            myCollectionViewC2.collectionViewLayout = layout2
            
        }
            
        else {
            itemSize2 = UIScreen.main.bounds.width/2.5
            let layout2 = UICollectionViewFlowLayout()
            layout2.sectionInset = UIEdgeInsetsMake(22, 22, 22, 22)
            layout2.itemSize = CGSize(width: itemSize2 + 8, height: itemSize2*5/6)
            layout2.minimumInteritemSpacing = 0
            layout2.minimumLineSpacing = 18
            myCollectionViewC2.collectionViewLayout = layout2
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array1C2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = myCollectionViewC2.dequeueReusableCell(withReuseIdentifier: "cellW2", for: indexPath ) as! myCell2
        cell2.myImage2.image = UIImage(named: array1C2[indexPath.row])
        
        var frm: CGRect = cell2.myImage2.frame
        frm.origin.x = frm.origin.x
        frm.origin.y = frm.origin.y
        frm.size.width = UIScreen.main.bounds.height/14.72
        frm.size.height = UIScreen.main.bounds.height/14.72
        cell2.myImage2.frame = frm
        
        cell2.myLabel2.text = "\(array2C2[indexPath.row])"
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
