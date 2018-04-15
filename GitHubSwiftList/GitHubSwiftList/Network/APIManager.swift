//
//  APIManager.swift
//  GitHubSwiftList
//
//  Created by Pedro Lopes on 15/04/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import Foundation
import Alamofire

class APIManager{
    
    static let sharedInstance = APIManager()
    var repoList: [Repository] = []
    var isGettingData = false
    
    func requestRepoList(resultPage: Int = 1, successHandler: @escaping (_ successObject: RepositoryList?) -> ()){
        
        self.isGettingData = true
        
        Alamofire.request("\(vBaseURL+vRepoListEndpoint)\(vLanguageSwift)&\(vResultPage)\(resultPage)").responseJSON { response in
            switch response.result {
            case .success:
                do{
                    let data = response.data
                    let responseList = try JSONDecoder().decode(RepositoryList.self, from: data!)
                    
                    self.repoList.append(contentsOf: responseList.list)
                    
                    successHandler(responseList)
                    self.isGettingData = false
                    
                    
                } catch let error{
                    print ("Error while parsing response")
                    print (error)
                    self.isGettingData = false
                    
                }
            case .failure(_):
                print ("Could not retrieve information from url")
                successHandler(nil)
                self.isGettingData = false
                
            }
        }
    }
}
