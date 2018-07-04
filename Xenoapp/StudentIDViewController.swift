//
//  StudentIDViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 20/06/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

protocol studentDelegate {
    func parseData()
}

class StudentIDViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

 
    @IBOutlet weak var PhotoID2: UIImageView!
    @IBOutlet weak var studentID: UILabel!
    @IBOutlet weak var lastVisited2: UILabel!
    @IBOutlet weak var orangeView2: UIView!
    @IBOutlet weak var myCollectionView2: UICollectionView!
    
    var delegateStudent : studentDelegate?
    let array21: [String] = ["10-1","20","30","40","50","60","70","80","90","100","110","120","130"]
    let array22: [String] = ["TimeTable", "HomeWork", "ClassWork", "School", "Reminder", "Competition", "Exam", "StudyMaterial", "Attendance", "Result", "Certificate", "Library", "Calender"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var itemSize2: CGFloat
        
        if UIScreen.main.bounds.height == 568 {
            
            itemSize2 = UIScreen.main.bounds.width/3 - UIScreen.main.bounds.height/490.6666
            
        }
            
        else { itemSize2 = UIScreen.main.bounds.width/3 }
        let layout2 = UICollectionViewFlowLayout()
        layout2.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout2.itemSize = CGSize(width: itemSize2, height: itemSize2)
        layout2.minimumInteritemSpacing = 0
        layout2.minimumLineSpacing = 0
        myCollectionView2.collectionViewLayout = layout2
        
        PhotoID2.frame.size.height = UIScreen.main.bounds.height/7.36
        PhotoID2.frame.size.width
            = UIScreen.main.bounds.height/7.36
        
        if UIScreen.main.bounds.height == 568 {
            var frm: CGRect = PhotoID2.frame
            frm.origin.x = frm.origin.x - 5
            frm.origin.y = frm.origin.y + 20
            PhotoID2.frame = frm
            }
            
         /*   var frm1: CGRect = schoolName2.frame
            //frm1.origin.x = frm1.origin.x - 5
            frm1.origin.y = frm1.origin.y + 8
            schoolName2.frame = frm1
        }*/
        
        studentID.font = studentID.font.withSize(UIScreen.main.bounds.height/49.066666)
        lastVisited2.font = lastVisited2.font.withSize(UIScreen.main.bounds.height/49.066666)
        //helperLabel2.font = helperLabel2.font.withSize(UIScreen.main.bounds.height/49.066666)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of views in the collection view.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array21.count
    }
    
    
    // Populate view.
    func collectionView(_ collectionView2: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell2 = collectionView2.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath ) as! myCell2
        cell2.myImage2.image = UIImage(named: array21[indexPath.row])
        
        var frm: CGRect = cell2.myImage2.frame
        frm.origin.x = frm.origin.x
        frm.origin.y = frm.origin.y
        frm.size.width = UIScreen.main.bounds.height/14.72
        frm.size.height = UIScreen.main.bounds.height/14.72
        cell2.myImage2.frame = frm
        
        cell2.myLabel2.text = "\(array22[indexPath.row])"
        cell2.myLabel2.font = cell2.myLabel2.font.withSize(UIScreen.main.bounds.height/49.066666)
        
        cell2.layer.borderWidth = 0.225
        return cell2
        
    }
}
