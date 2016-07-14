//
//  SentMemesCollectionViewController.swift
//  ImagePicker
//
//  Created by Kevin Casado on 7/13/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.
//

import Foundation
import UIKit

class SentMemesCollectionViewController: UICollectionViewController
{
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        let space: CGFloat = 3.0
        let dimension = (self.view.frame.size.width-(2*space)) / 3.0
        flowLayout.minimumInteritemSpacing=space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }
    // MARK: Collection View Data Source
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SentMemeCollectionViewCell", forIndexPath: indexPath) as! SentMemeCollectionViewCell
        let meme = self.memes[indexPath.row]
        
        // Set the name and image
        
        cell.MemeImageView?.image = meme.memeImage
        
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath)
    {
        
        
        
    }

    
}