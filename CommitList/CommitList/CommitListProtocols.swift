//
//  CommitListProtocols.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import UIKit
import Alamofire

protocol CommitListViewModelProtocol {
    var view: CommitListViewControllerProtocol! {get set}
    var service: CommitsServiceProtocol! {get set}
    var title: String {get}
    var cellModels: [CommitCellModelProtocol] {get}
    
    func viewDidLoad()
    func numberOfRows() -> Int
    func cellModel(indexPath: IndexPath) -> CommitCellModelProtocol
    func isDetailedViewHidden() -> Bool
}

protocol CommitListViewControllerProtocol: UIViewController {
    var viewModel: CommitListViewModelProtocol! {get set}
    var tableView: UITableView {get}
}

protocol CommitsServiceProtocol {
    func getCommits(completion: @escaping(Result<Any, AFError>) -> Void)
}

protocol CommitTableViewCellDelegate: class {
    func detailedLabelTapped(labelText: String)
}

protocol CommitCellModelProtocol {
    var nameLabelText: String {get}
    var hashLabelText: String {get}
    var messageLabelText: String {get}
    var imageUrl: URL? {get}
}
