//
//  ParentIDViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 18/06/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

protocol parentDelegate {
    func parseData()
}

class ParentIDViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

  
    @IBOutlet weak var lastVisited: UILabel!
    @IBOutlet weak var parentID: UILabel!
    @IBOutlet weak var photoID: UIImageView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var helperView: UIView!
    
    var delegateParent : parentDelegate?
    let array: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    let array2: [String] = ["TimeTable", "HomeWork", "ClassWork", "Attendance", "Reminder", "Remark", "Result", "Calender", "Fee Status", "Complaints", "School", "Teacher"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var itemSize: CGFloat
     
            
            itemSize = UIScreen.main.bounds.width/3 - UIScreen.main.bounds.height/490.6666
            

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = UIScreen.main.bounds.height/3680
        myCollectionView.collectionViewLayout = layout
        
        photoID.frame.size.height = UIScreen.main.bounds.height/7.36
        photoID.frame.size.width
            = UIScreen.main.bounds.height/7.36
        
        if UIScreen.main.bounds.height == 568 {
        var frm: CGRect = photoID.frame
        frm.origin.x = frm.origin.x - 5
        frm.origin.y = frm.origin.y + 20
        photoID.frame = frm
    
        }
        
        parentID.font = parentID.font.withSize(UIScreen.main.bounds.height/49.066666)
        lastVisited.font = lastVisited.font.withSize(UIScreen.main.bounds.height/49.066666)
        //helperLabel.font = helperLabel.font.withSize(UIScreen.main.bounds.height/49.066666)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of views in the collection view.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }

    
    // Populate view.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath ) as! myCell
        cell.myImage.image = UIImage(named: array[indexPath.row])
        
        var frm: CGRect = cell.myImage.frame
        frm.origin.x = frm.origin.x
        frm.origin.y = frm.origin.y
        frm.size.width = UIScreen.main.bounds.height/14.72
        frm.size.height = UIScreen.main.bounds.height/14.72
        cell.myImage.frame = frm
        
        cell.myLabel.text = "\(array2[indexPath.row])"
        cell.myLabel.font = cell.myLabel.font.withSize(UIScreen.main.bounds.height/49.066666)
        
        cell.layer.borderWidth = 0.225 //UIScreen.main.bounds.height/3680
        return cell
        
    }
}
