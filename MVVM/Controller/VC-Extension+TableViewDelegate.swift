//
//  VC-Extension+TableViewDelegate.swift
//  MVVM
//
//  Created by 洪晨希 on 2018/5/25.
//  Copyright © 2018年 洪晨希. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
