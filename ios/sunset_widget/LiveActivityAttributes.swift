//
//  LiveActivityAttributes.swift
//  Runner
//
//  Created by Waseem Siddiqi on 04/08/24.
//

import Foundation
import ActivityKit
struct LiveActivitiesAppAttributes: ActivityAttributes, Identifiable {
    public typealias LiveDeliveryData = ContentState // don't forget to add this line, otherwise, live activity will not display it.

     public struct ContentState: Codable, Hashable { }
     
     var id = UUID()
}

extension LiveActivitiesAppAttributes {
  func prefixedKey(_ key: String) -> String {
    return "\(id)_\(key)"
  }
}
