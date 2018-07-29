//
//  ViewTeachersCollectionViewCell.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 23/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit


class ViewTeachersCollectionViewCell: UICollectionViewCell {
    
    var emp_uid = ""
    var helpDecide = false
 
    
    
    
    @IBOutlet weak var deleteImage: UIImageView!
    @IBOutlet weak var forwardArror: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    func editingInProgress() {
        deleteImage.isHidden = false
        forwardArror.isHidden = true
    }
    
    func editingDone() {
        deleteImage.isHidden = true
        forwardArror.isHidden = false
    }
    
    func necessaryFunction() {
        deleteImage.isHidden = true
        }
}
