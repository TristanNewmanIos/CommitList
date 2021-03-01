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
    var cellModels: [CommitCellModelProtocol] = []
    
    func viewDidLoad() {
        createData()
    }
    
    func numberOfRows() -> Int {
        return commits.count
    }
    
    func cellModel(indexPath: IndexPath) -> CommitCellModelProtocol {
        return cellModels[indexPath.row]
    }
    
    private func createData() {
        getCommits()
        
        commits.forEach {
            cellModels.append(CommitCellViewModel(nameLabelText: $0.commitDetails.author.name, hashLabelText: $0.commitHash, messageLabelText: $0.commitDetails.message))
        }
    }
    
    private func getCommits() {
        service.getCommits(completion: { (result) in
            switch result {
            case .success(let value):
                self.commitsResponseObject = CommitsResponseObject(json: value)
                if let commits = self.commitsResponseObject?.commits {
                    self.commits = commits
                }
                
            case .failure(let error):
                print("your error was: ", error.errorDescription)
            }
        })
    }
}
