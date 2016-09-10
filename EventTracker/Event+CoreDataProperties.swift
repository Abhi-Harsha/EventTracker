//
//  Event+CoreDataProperties.swift
//  EventTracker
//
//  Created by Abhishek H P on 9/10/16.
//  Copyright © 2016 Abhishek H P. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Event {

    @NSManaged var entry_type: String?
    @NSManaged var event_name: String?
    @NSManaged var image: NSData?
    @NSManaged var location: String?
    @NSManaged var trackingUserName: String?

}
