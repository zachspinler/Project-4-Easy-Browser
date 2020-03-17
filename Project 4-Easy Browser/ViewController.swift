//
//  ViewController.swift
//  Project 4-Easy Browser
//
//  Created by Zach Spinler on 3/12/20.
//  Copyright © 2020 Zach Spinler. All rights reserved.
//

import UIKit
import WebKit

//Challenge 3 converting VC to TableViewController

class ViewController: UITableViewController, WKNavigationDelegate {
    
    private var websites = ["apple.com", "hackingwithswift.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Easy Browser"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WebsiteCell", for: indexPath)
        let website = websites[indexPath.row]
        cell.textLabel?.text = website
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController else {
            fatalError("Unable to instantiate WebViewController")
        }
        vc.websites = websites
        vc.selectedWebsiteIndex = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
}
