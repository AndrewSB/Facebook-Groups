//
//  GroupViewController.swift
//  Facebook Groups
//
//  Created by Andrew Breckenridge on 5/16/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {
    @IBOutlet weak var postTableView: UITableView!
    
    var posts: [Post]? {
        didSet {
            postTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        postTableView.dataSource = self
        postTableView.delegate = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GroupViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts == nil ? 0 : posts!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID") as! UITableViewCell
        
        cell.textLabel?.text = posts![indexPath.row].description
        cell.detailTextLabel?.text = "sdf"
        
        return cell
    }
}

