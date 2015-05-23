//
//  AddPostViewController.swift
//  Facebook Groups
//
//  Created by Sean Breckenridge on 5/22/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController {
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    let picker = UIImagePickerController()
    var imageData = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photoCollectionView.delegate = self
        self.photoCollectionView.dataSource = self
        
        picker.delegate = self
    }
    
    
    @IBAction func doneButtonWasHit(sender: UIBarButtonItem) {
        //upload comment
        
        self.performSegueWithIdentifier("unwindToGroupList", sender: self)
    }
}

extension AddPostViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count + 1
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        
        switch indexPath.row {
            
        case imageData.count:
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("newCell", forIndexPath: indexPath) as! UICollectionViewCell
        default:
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("photo", forIndexPath: indexPath) as! UICollectionViewCell
            let imgV = UIImageView(image: imageData[indexPath.row])
            imgV.frame = cell.frame
            cell.backgroundView = imgV
        }
        
        return cell
    }
}

extension AddPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageData.append(image)
        photoCollectionView.reloadData()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}