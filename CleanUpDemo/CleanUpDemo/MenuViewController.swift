//
//  MenuViewController.swift
//  CleanUpDemo
//
//  Created by KIEU, HAI on 8/6/19.
//  Copyright © 2019 Hai Kieu. All rights reserved.
//

import UIKit

let kReusedCell = "ReusedCell"

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let vc = segue.destination as? LogOutViewController, let mode = sender as? Int {
      vc.mode = mode
    }
  }
}

extension MenuViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "Push", sender: indexPath.row)
  }
}

extension MenuViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: kReusedCell) ?? UITableViewCell.init(style: .default, reuseIdentifier: kReusedCell)
    
    switch indexPath.row {
    case 0: cell.textLabel?.text = "Log Out"
    case 1: cell.textLabel?.text = "Log Out With DumpTruck"
    default: fatalError()
    }
    
    return cell
  }
}
