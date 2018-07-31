//
//  FullRes+CoreDataProperties.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 29/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//
//

import Foundation
import CoreData


extension FullRes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FullRes> {
        return NSFetchRequest<FullRes>(entityName: "FullRes")
    }

    @NSManaged public var imageData: NSData?
    @NSManaged public var thumbnail: Thumbnail?

}
