//
//  Thumbnail+CoreDataProperties.swift
//  Xenoapp
//
//  Created by Abhishek Sansanwal on 29/07/18.
//  Copyright © 2018 Abhishek Sansanwal. All rights reserved.
//
//

import Foundation
import CoreData


extension Thumbnail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thumbnail> {
        return NSFetchRequest<Thumbnail>(entityName: "Thumbnail")
    }

    @NSManaged public var imageData: NSData?
    @NSManaged public var id: Double
    @NSManaged public var fullRes: FullRes?

}
