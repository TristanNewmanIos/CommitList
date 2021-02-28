//
//  CommitListViewModel.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import Foundation

class CommitListViewModel: CommitListViewModelProtocol {
    
    var view: CommitListViewControllerProtocol!
    var service: CommitsServiceProtocol!
    
    var commitsResponseObject: CommitsResponseObject?
    var commits = [Commit]()
    
    func viewDidLoad() {
        createData()
    }
    
    private func createData() {
        getCommits()
    }
    
    private func getCommits() {
        service.getCommits(completion: { (result) in
            switch result {
            case .success(let value):
                self.commitsResponseObject = CommitsResponseObject(json: value)
                
                commits = commitsResponseObject?.commits
                
            case .failure(let error):
                print("your error was: ", error.description)
            }
        })
    }
}
