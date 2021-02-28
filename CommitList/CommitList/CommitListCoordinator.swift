//
//  CommitListCoordinator.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import UIKit

class CommitListCoordinator {
    var window: UIWindow?
    var navigationController: UINavigationController?
    
    init(withWindow window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        var viewController: CommitListViewControllerProtocol = CommitListViewController()
        var viewModel: CommitListViewModelProtocol = CommitListViewModel()
        let service: CommitsServiceProtocol = CommitsService()
        
        viewController.viewModel = viewModel
        viewModel.view = viewController
        viewModel.service = service
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
