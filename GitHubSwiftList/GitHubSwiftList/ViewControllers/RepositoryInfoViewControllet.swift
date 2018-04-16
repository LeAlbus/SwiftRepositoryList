//
//  RepositoryInfoViewControllet.swift
//  GitHubSwiftList
//
//  Created by Pedro Lopes on 15/04/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class RepositoryInfoViewController: UIViewController{
    
    @IBOutlet weak var ownerAvatar: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var creationDate: UILabel!
    @IBAction func viewOnBrowser(sender: UIButton){
        print("Open Browser")
    }
    
    var repoInfo: Repository?
    
    
    func setData(selectedRepo: Repository){
        self.repoInfo = selectedRepo
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setup()

    }
    
    func setup(){
        
        if self.repoInfo != nil{
            self.repoNameLabel.text = repoInfo?.repoName
            self.descriptionLabel.text = repoInfo?.repoDescription
            self.ownerNameLabel.text = repoInfo?.ownerInfo.userName

            let dateStr = repoInfo?.creationDate
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let date = dateFormatter.date(from: dateStr!)
            
            dateFormatter.dateFormat = "dd-MMM-yyyy"
            
            let finalDateString = dateFormatter.string(from: date!)
            self.creationDate.text = "Created on \(finalDateString)"
            
            let imagePath = repoInfo?.ownerInfo.avatarPath
            let placeholderImage = UIImage(named: "Profile")!
            self.ownerAvatar.af_setImage(withURL: URL(string: imagePath!)!, placeholderImage: placeholderImage)
            
        }
    }
}
