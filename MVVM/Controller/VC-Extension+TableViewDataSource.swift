//
//  VC-Extension+TableViewDataSource.swift
//  MVVM
//
//  Created by 洪晨希 on 2018/5/25.
//  Copyright © 2018年 洪晨希. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messierViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        cell.imageView?.image = UIImage(named: messierViewModel[indexPath.row].thumbnail)
        cell.textLabel?.text = messierViewModel[indexPath.row].formalName
        cell.detailTextLabel?.text = messierViewModel[indexPath.row].commonName
        
        return cell
        
    }
    
}
