//
//  CommitListProtocols.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import UIKit

protocol CommitListViewModelProtocol {
    var view: CommitListViewControllerProtocol! {get set}
    var service: CommitsServiceProtocol! {get set}
    
    func viewDidLoad()
}

protocol CommitListViewControllerProtocol: UIViewController {
    var viewModel: CommitListViewModelProtocol! {get set}
}

protocol CommitsServiceProtocol {
    func getCommits(completion: @escaping() -> Void)
}
