//
//  CommitListViewController.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import UIKit

class CommitListViewController: UIViewController, CommitListViewControllerProtocol {
    var viewModel: CommitListViewModelProtocol!
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(CommitTableViewCell.self, forCellReuseIdentifier: CommitTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var overlayView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: .zero, alpha: 0.8)
        
        return view
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.backgroundColor = .gr
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpView()
    }
    
    private func setUpView() {
        func addViews() {
            view.addSubview(tableView)
            view.addSubview(overlayView)
        }
        
        func addConstraints() {
            tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            
            overlayView.topAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
            overlayView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor).isActive = true
            overlayView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
            overlayView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor).isActive = true
        }
        
        addViews()
        addConstraints()
    }
}

extension CommitListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommitTableViewCell.identifier) as? CommitTableViewCell else {
            return CommitTableViewCell()
        }
        
        cell.configure()
        return cell
    }
}
