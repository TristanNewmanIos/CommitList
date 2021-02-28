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
    
    func viewDidLoad()
}

protocol CommitListViewControllerProtocol: UIViewController {
    var viewModel: CommitListViewModelProtocol! {get set}
}

protocol CommitsServiceProtocol {
    func getCommits(completion: @escaping(Result<Any, AFError>) -> Void)
}

protocol CommitTableViewCellDelegate: class {
    func detailedLabelTapped(labelText: String)
}
