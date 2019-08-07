//
//  DumbTruck.swift
//  CleanUpDemo
//
//  Created by KIEU, HAI on 8/6/19.
//  Copyright © 2019 Hai Kieu. All rights reserved.
//

import Foundation

final class DumbTruck {
  static func empty(_ object: Any?) {
    
    var capture = [object]
    
    DispatchQueue.global().async {
      //Clean up memory take place here
      capture.removeAll()
    }
  }
}
