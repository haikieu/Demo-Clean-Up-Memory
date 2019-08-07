//
//  Models.swift
//  CleanUpDemo
//
//  Created by KIEU, HAI on 8/6/19.
//  Copyright © 2019 Hai Kieu. All rights reserved.
//

import UIKit

class Conversation {
  
  var messages = [Message]()
  
  init() {
    for _ in 1...10000 {
      messages.append(Message())
    }
  }
  
  deinit {
    print("Deallocating on mainThread=\(Thread.current.isMainThread)")
  }
}

class Message {
  
  var sender = User()
  var reciept = User()
  
  var text: String = sampleText
  var dateTime = Date()
}

class User {
  var name = "User"
  var avartar = UIImage()
  var age = 18
  var male = true
}

let sampleText = "Sample Text"
