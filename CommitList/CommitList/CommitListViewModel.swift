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
    var cellModels: [CommitCellModelProtocol] = []
    
    func viewDidLoad() {
        createData()
    }
    
    func numberOfRows() -> Int {
        return cellModels.count
    }
    
    func cellModel(indexPath: IndexPath) -> CommitCellModelProtocol {
        return cellModels[indexPath.row]
    }
    
    private func createData() {
        getCommits()
            
    }
    
    private func getCommits() {
        
        let queue = DispatchQueue.init(label: "queue")
        let group = DispatchGroup()
        
        group.enter()
        service.getCommits(completion: { (result) in
            switch result {
            case .success(let value):
                self.commitsResponseObject = CommitsResponseObject(json: value)
                if let commits = self.commitsResponseObject?.commits {
                    commits.forEach {
                        self.cellModels.append(CommitCellViewModel(nameLabelText: $0.commitDetails.author.name, hashLabelText: $0.commitHash, messageLabelText: $0.commitDetails.message))
                    }
                }
                group.leave()
                
            case .failure(let error):
                print("your error was: ", error.errorDescription)
                group.leave()
            }
            
        })
        
        group.notify(queue: queue, execute: {
            DispatchQueue.main.async {
                self.view.tableView.reloadData()
            }
        })
        
    }
}
