//
//  UserModel.swift
//  simple
//
//  Created by andre on 10/7/20.
//

import Foundation

class User {
    public var name: String
    public var avatar: String
    public var follower: Int
    
    init(name: String, avatar: String, follower: Int) {
        self.name = name
        self.avatar = avatar
        self.follower = follower
    }
}
