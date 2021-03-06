//
//  RepositoryListController.swift
//  GitHubSwiftList
//
//  Created by Pedro Lopes on 15/04/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class RepositoryListController: UITableViewController{
    
    var loadedPages = 1
    var selectedRepoInfo: Repository?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.sharedInstance.requestRepoList(){
            response in
            if response != nil{
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return APIManager.sharedInstance.repoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell")! as! RepositoryCellController
        
        if !APIManager.sharedInstance.repoList.isEmpty{
            
            let projectForCell = APIManager.sharedInstance.repoList[indexPath.row]
            cell.repoInfo = projectForCell
            cell.setup()
            
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showRepoInfo" && selectedRepoInfo != nil{
            
            let informationView = segue.destination as! RepositoryInfoViewController
            informationView.setData(selectedRepo: selectedRepoInfo!)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let selectedRepo: Repository = APIManager.sharedInstance.repoList[indexPath.row]
        self.selectedRepoInfo = selectedRepo
        
        self.performSegue(withIdentifier: "showRepoInfo", sender: self)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView){
        let scrollViewHeight = scrollView.frame.size.height;
        let scrollContentSizeHeight = scrollView.contentSize.height;
        let scrollOffset = scrollView.contentOffset.y;
        
        if ((scrollOffset + scrollViewHeight) - 20 >= scrollContentSizeHeight && !APIManager.sharedInstance.isGettingData)
        {
            self.loadedPages += 1
            APIManager.sharedInstance.requestRepoList(resultPage: self.loadedPages){ response in
                
                self.tableView.reloadData()
            }
        }
    }
}
