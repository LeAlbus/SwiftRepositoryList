//
//  User.swift
//  GitHubSwiftList
//
//  Created by Pedro Lopes on 15/04/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import Foundation

struct User: Decodable{
    
    let id: Int
    let userName: String
    let avatarPath: String
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case userName = "login"
        case avatarPath = "avatar_url"
    }
}
