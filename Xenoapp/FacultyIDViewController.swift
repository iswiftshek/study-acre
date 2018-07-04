//
//  FacultyIDViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 22/06/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

protocol facultyDelegate {
    func parseData()
}

class FacultyIDViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var schoolName3: UILabel!
    @IBOutlet weak var photoID3: UIImageView!
    @IBOutlet weak var facultyID: UILabel!
    @IBOutlet weak var lastVisited3: UILabel!
    @IBOutlet weak var helperLabel3: UILabel!
    @IBOutlet weak var orangeView3: UIView!
    @IBOutlet weak var myCollectionView3: UICollectionView!
    
    var delegateFaculty : facultyDelegate?
    let array31: [String] = ["100-1","200","300","400","500","600","700","800","900","1000","1100","1200","1300"]
    let array32: [String] = ["TimeTable", "ClassWork", "Assign HomeWork", "Class", "StudyMaterial", "Extra Knowledge", "School", "Remark Student", "Calender", "Edit Student", "Class Attendance", "Exam", "Complaint"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var itemSize3: CGFloat
        
        if UIScreen.main.bounds.height == 568 {
            
            itemSize3 = UIScreen.main.bounds.width/3 - UIScreen.main.bounds.height/490.6666
            
        }
    
        else { itemSize3 = UIScreen.main.bounds.width/3 }
        let layout3 = UICollectionViewFlowLayout()
        layout3.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout3.itemSize = CGSize(width: itemSize3, height: itemSize3)
        layout3.minimumInteritemSpacing = 0
        layout3.minimumLineSpacing = 0
        myCollectionView3.collectionViewLayout = layout3
        
        photoID3.frame.size.height = UIScreen.main.bounds.height/7.36
        photoID3.frame.size.width
            = UIScreen.main.bounds.height/7.36
        
        if UIScreen.main.bounds.height == 568 {
            var frm: CGRect = photoID3.frame
            frm.origin.x = frm.origin.x - 5
            frm.origin.y = frm.origin.y + 20
            photoID3.frame = frm
            
            var frm1: CGRect = schoolName3.frame
            //frm1.origin.x = frm1.origin.x - 5
            frm1.origin.y = frm1.origin.y + 8
            schoolName3.frame = frm1
            
            
        }
        
        
       //schoolName3.font = schoolName3.font.withSize(UIScreen.main.bounds.height/27)
        facultyID.font = facultyID.font.withSize(UIScreen.main.bounds.height/49.066666)
        lastVisited3.font = lastVisited3.font.withSize(UIScreen.main.bounds.height/49.066666)
        //helperLabel3.font = helperLabel3.font.withSize(UIScreen.main.bounds.height/49.066666)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.[//
    }
    
    // Number of views in the collection view.
    func collectionView(_ collectionView3: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array31.count
    }
    
    
    // Populate view.
    func collectionView(_ collectionView3: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell3 = collectionView3.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath ) as! myCell2
        cell3.myImage2.image = UIImage(named: array31[indexPath.row])
        
      
            
        var frm: CGRect = cell3.myImage2.frame
        frm.origin.x = frm.origin.x 
        frm.origin.y = frm.origin.y
        frm.size.width = UIScreen.main.bounds.height/14.72
        frm.size.height = UIScreen.main.bounds.height/14.72
        cell3.myImage2.frame = frm
            
        
        
        cell3.myLabel2.text = "\(array32[indexPath.row])"
        cell3.myLabel2.font = cell3.myLabel2.font.withSize(UIScreen.main.bounds.height/49.066666)
        
        cell3.layer.borderWidth = 0.225
        return cell3
        
    }

}
