//
//  AdminIDViewController.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 22/06/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

protocol adminDelegate {
    func parseData()
}

class AdminIDViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var photoID4: UIImageView!
    @IBOutlet weak var adminID: UILabel!
    @IBOutlet weak var lastVisited4: UILabel!
    @IBOutlet weak var orangeView4: UIView!
    @IBOutlet weak var collectionView4: UICollectionView!
    @IBOutlet weak var helperLabel4: UILabel!
    
    var labelText = String()
    var delegateAdmin : adminDelegate?
    let array41: [String] = ["a","b", "c", "d"]
    let array42: [String] = ["Sub Admin", "Remove Sub Admin", "Principal's Message", "Add Option"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lastVisited4.text = labelText
        var itemSize4: CGFloat
        
         let layout4 = UICollectionViewFlowLayout()
        
        if UIScreen.main.bounds.height == 568 {
            
            itemSize4 = UIScreen.main.bounds.width/2 - UIScreen.main.bounds.height/490.6666
              layout4.itemSize = CGSize(width: itemSize4, height: itemSize4*(9/10))
            
        }
            
        else { itemSize4 = UIScreen.main.bounds.width/2
            layout4.itemSize = CGSize(width: itemSize4, height: itemSize4*(3/4))
        }
        layout4.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout4.minimumInteritemSpacing = 0
        layout4.minimumLineSpacing = 0
        collectionView4.collectionViewLayout = layout4
        
        photoID4.frame.size.height = UIScreen.main.bounds.height/7.36
        photoID4.frame.size.width
            = UIScreen.main.bounds.height/7.36
        
        if UIScreen.main.bounds.height == 568 {
            var frm: CGRect = photoID4.frame
            frm.origin.x = frm.origin.x - 5
            frm.origin.y = frm.origin.y + 20
            photoID4.frame = frm
            
        }
        
        adminID.font = adminID.font.withSize(UIScreen.main.bounds.height/49.066666)
        lastVisited4.font = lastVisited4.font.withSize(UIScreen.main.bounds.height/49.066666)
        //helperLabel4.font = helperLabel4.font.withSize(UIScreen.main.bounds.height/49.066666)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of views in the collection view.
    func collectionView(_ collectionView4: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array41.count
    }
    
    
    // Populate view.
    func collectionView(_ collectionView4: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell4 = collectionView4.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath ) as! myCell
        cell4.myImage.image = UIImage(named: array41[indexPath.row])
        
        var frm: CGRect = cell4.myImage.frame
        frm.origin.x = frm.origin.x
        frm.origin.y = frm.origin.y
        frm.size.width = UIScreen.main.bounds.height/(14.72*(3/4))
        frm.size.height = UIScreen.main.bounds.height/(14.72*(3/4))
        cell4.myImage.frame = frm
        
        cell4.myLabel.text = "\(array42[indexPath.row])"
        cell4.myLabel.font = cell4.myLabel.font.withSize(UIScreen.main.bounds.height/49.066666)
        
        cell4.layer.borderWidth = 0.225
        return cell4
        
    }

}
