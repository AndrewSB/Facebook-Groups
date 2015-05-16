//
//  GroupListViewController.swift
//  Facebook Groups
//
//  Created by Andrew Breckenridge on 5/16/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit
import CoreData

class GroupListViewController: UIViewController {
    @IBOutlet weak var groupTableView: UITableView!
    
    var groups: [Group]? {
        didSet {
            groupTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        groups = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!.executeFetchRequest(NSFetchRequest(entityName: "Group"), error: nil) as? [Group]

        println(groups)
        
        groupTableView.dataSource = self
        groupTableView.delegate = self
    }

    @IBAction func logoutButtonWasHit(sender: AnyObject) {
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

extension GroupListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups == nil ? 0 : groups!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID") as! UITableViewCell
        
        cell.textLabel?.text = groups![indexPath.row].name
        cell.detailTextLabel?.text = "sdf"
        
        return cell
    }
}
