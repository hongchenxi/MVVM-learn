//
//  ViewController.swift
//  MVVM
//
//  Created by 洪晨希 on 2018/5/25.
//  Copyright © 2018年 洪晨希. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let destinationViewController = segue.destination as? DetailViewController {
                let indexPath = self.tableView.indexPathForSelectedRow!
                let index = indexPath.row
                destinationViewController.messierViewModel = messierViewModel[index]
            }
        }
    }

}

