//
//  Venue.swift
//  test6.2
//
//  Created by computer on 3/24/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

import UIKit

class Venue: PFObject, PFSubclassing {
    @NSManaged var venueName: String
    @NSManaged var thumbImg: PFFile
    @NSManaged var lgImg: PFFile
    @NSManaged var lat: PFGeoPoint
    @NSManaged var long: PFGeoPoint
    
    override class func load() {
        self.registerSubclass()
    }
    
    class func parseClassName() -> String! {
        return "Venue"
    }
}
