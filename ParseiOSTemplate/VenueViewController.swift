//
//  VenueViewController.swift
//  test6.2
//
//  Created by computer on 3/24/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

import UIKit

class VenueViewController: UICollectionViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var venueItems: [Venue] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchItems()
    }
    
    func fetchItems() {
        venueItems.removeAll(keepCapacity: false)
        let prepItems = Venue.query()

        prepItems.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                for object in objects {
                    self.venueItems.append(object as Venue)
                }
            } else {
                NSLog("Error %@ %@", error, error.userInfo!)
            }
            self.collectionView?.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.venueItems.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("venueCell", forIndexPath: indexPath) as VenueItemCell
        let currentItem = venueItems[indexPath.row]
        let imageView = PFImageView()
        imageView.image = UIImage(named: "1.png")
        imageView.file = currentItem.thumbImg
        
        imageView.loadInBackGround()
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
