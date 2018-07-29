//
//  Picture+CoreDataProperties.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 29/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//
//

import Foundation
import CoreData


extension Picture {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Picture> {
        return NSFetchRequest<Picture>(entityName: "Picture")
    }

    @NSManaged public var photo: NSData?

}
