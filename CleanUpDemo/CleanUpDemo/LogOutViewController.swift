//
//  ViewController.swift
//  CleanUpDemo
//
//  Created by KIEU, HAI on 8/6/19.
//  Copyright © 2019 Hai Kieu. All rights reserved.
//

import UIKit

class LogOutViewController: UIViewController {

  @IBOutlet weak var mainLabel: UILabel!
  @IBOutlet weak var fpsLabel: UILabel!
  @IBOutlet weak var logOutBtn: UIButton!
  
  var mode: Int = 0
  
  var counter: FPSCounter!
  
  lazy var conversations: [Conversation] = {
    var array = [Conversation]()
    for _ in 1...100 { array.append(Conversation()) }
    return array
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    _ = conversations
    
    //Setup FPS counter
    counter = FPSCounter()
    counter.delegate = self
    counter.startTracking()
    
    //Setup UI
    if mode == 1 { logOutBtn.setTitle("Log Out With DumpTruck", for: .normal) }
    navigationItem.hidesBackButton = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }


  @IBAction @objc func onLogOut(_ button: UIButton) {
    
    switch mode {
    case 0: logOut()
    case 1: logOutWithDumpTruck()
    default: fatalError()
    }
    
    mainLabel.text = nil
    button.setTitle("Log Out Done!", for: .normal)
    navigationItem.hidesBackButton = false
  }
  
  func logOut() {
    
    conversations = []
  }
  
  func logOutWithDumpTruck() {
    
    //Ask DumpTruck to empty the conversations
    DumpTruck.empty(conversations)
    
    //Remove tie to the removed conversations
    conversations = []
  }
}

extension LogOutViewController: FPSCounterDelegate {
  func fpsCounter(_ counter: FPSCounter, didUpdateFramesPerSecond fps: Int) {
    fpsLabel.text = "FPS: \(fps)"
  }
}
