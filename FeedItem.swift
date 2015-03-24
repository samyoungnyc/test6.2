//
//  FeedItem.swift
//  test6.2
//
//  Created by computer on 3/24/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

import UIKit

class FeedItem: PFObject, PFSubclassing {
    @NSManaged var venueName: String
    @NSManaged var imageFile: PFImageView
    @NSManaged var userName: String
   
    override class func load() {
        self.registerSubclass()
    }
    
    class func parseClassName() -> String! {
        return "FeedItem"
    }
}
