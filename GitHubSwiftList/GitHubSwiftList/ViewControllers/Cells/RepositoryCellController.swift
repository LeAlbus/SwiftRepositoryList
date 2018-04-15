//
//  RepositoryCellController.swift
//  GitHubSwiftList
//
//  Created by Pedro Lopes on 15/04/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class RepositoryCellController: UITableViewCell{
    
    @IBOutlet weak var starsLabel: UILabel!

    @IBOutlet weak var branchesLabel: UILabel!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var projectDescription: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    var repoInfo: Repository?
    
    func setup(){
        
        if repoInfo != nil{
            
            self.branchesLabel.text = String(repoInfo!.forksCount)
            self.starsLabel.text = String(repoInfo!.starsCount)
            self.projectName.text = repoInfo?.repoName ?? "Project name"
            self.projectDescription.text = repoInfo?.repoDescription ?? "Repository description"
            
            self.userName.text = repoInfo?.ownerInfo.userName ?? "Repository Owner"
            
            let imagePath = repoInfo?.ownerInfo.avatarPath
            let placeholderImage = UIImage(named: "Profile")!
            self.profilePic.af_setImage(withURL: URL(string: imagePath!)!, placeholderImage: placeholderImage)
        }
    }
}
