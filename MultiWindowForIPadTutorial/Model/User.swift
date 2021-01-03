//
//  User.swift
//  MultiWindowForIPadTutorial
//
//  Created by Drink Sirichai on 30/11/2563 BE.
//  Copyright © 2563 Drink Sirichai. All rights reserved.
//

import Foundation
import MobileCoreServices

struct User {

    var name: String

    // NSUserActivity detail key
    static let activityType: String = "User"
    static let path: String = "UserDetail"
    // model key
    static let nameKey: String = "Name"

    var activity: NSUserActivity {
        let userActivity: NSUserActivity = NSUserActivity(activityType: User.activityType)
        userActivity.title = User.path
        userActivity.userInfo = [
            User.nameKey: name
        ]
        return userActivity
    }
}
