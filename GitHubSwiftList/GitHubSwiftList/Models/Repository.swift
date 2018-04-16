//
//  Repository.swift
//  GitHubSwiftList
//
//  Created by Pedro Lopes on 15/04/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import Foundation

struct RepositoryList: Decodable{
    
    let list: [Repository]
    
    private enum CodingKeys: String, CodingKey{
        case list = "items"
    }
}

struct Repository: Decodable{
    
    let forksCount: Int
    let starsCount: Int
    let repoName: String
    let repoDescription: String
    let creationDate: String
    let ownerInfo: User
    
    private enum CodingKeys: String, CodingKey{
        case forksCount = "forks_count"
        case starsCount = "stargazers_count"
        case repoName = "name"
        case repoDescription = "description"
        case creationDate = "created_at"
        case ownerInfo = "owner"
    }
}
