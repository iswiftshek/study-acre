//
//  TeachersMenuTableViewCell.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 09/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//

import UIKit

class TeachersMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblMenuName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
