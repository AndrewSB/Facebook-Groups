//
//  PostViewController.swift
//  Facebook Groups
//
//  Created by Andrew Breckenridge on 5/16/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    @IBOutlet weak var postTableView: UITableView!
    var comments: [Comment]? {
        didSet {
            postTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTableView.dataSource = self
        postTableView.delegate = self
    }

}

extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments == nil ? 0 : comments!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID") as! UITableViewCell
        
        cell.textLabel?.text = comments![indexPath.row].description
        cell.detailTextLabel?.text = "sdf"
        
        return cell
    }
}