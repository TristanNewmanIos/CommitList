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
        tableView.delegate = self
        tableView.register(CommitTableViewCell.self, forCellReuseIdentifier: CommitTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var overlayView: UIView = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(overlayTapped))
        
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: .zero, alpha: 0.8)
        view.isHidden = true
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    lazy var labelContainerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 4
        view.isUserInteractionEnabled = false
        
        return view
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.backgroundColor = .clear
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.text = "THIS IS HUGEEE TEXT DELETE THIS IS HUGEEE TEXT DELETE THIS IS HUGEEE TEXT DELETE THIS IS HUGEEE TEXT DELETE THIS IS HUGEEE TEXT DELETE THIS IS HUGEEE TEXT DELETE THIS IS HUGEEE TEXT DELETE THIS IS HUGEEE TEXT DELETE THIS IS HUGEEE TEXT DELETE THIS IS HUGEEE TEXT DELETE THIS IS HUGEEE TEXT DELETE"
        label.isHidden = true
        label.isUserInteractionEnabled = false
        
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
        title  = viewModel.title
        
        func addViews() {
            view.addSubview(tableView)
            view.addSubview(overlayView)
            overlayView.addSubview(labelContainerView)
            labelContainerView.addSubview(detailLabel)
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
            
            labelContainerView.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -50).isActive = true
            labelContainerView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 50).isActive = true
            labelContainerView.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor).isActive = true
            labelContainerView.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor).isActive = true
            
            detailLabel.leadingAnchor.constraint(equalTo: labelContainerView.leadingAnchor, constant: 15).isActive = true
            detailLabel.trailingAnchor.constraint(equalTo: labelContainerView.trailingAnchor, constant: -15).isActive = true
            detailLabel.topAnchor.constraint(equalTo: labelContainerView.topAnchor, constant: 15).isActive = true
            detailLabel.bottomAnchor.constraint(equalTo: labelContainerView.bottomAnchor, constant: -15).isActive = true
        }
        
        addViews()
        addConstraints()
    }
    
    @objc func overlayTapped() {
        let hide = viewModel.isDetailedViewHidden()
        
        overlayView.isHidden = hide
        detailLabel.isHidden = hide
    }
}

extension CommitListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommitTableViewCell.identifier) as? CommitTableViewCell else {
            return CommitTableViewCell()
        }
        
        cell.configure(cellDelegate: self, cellModel: viewModel.cellModel(indexPath: indexPath))
        return cell
    }
}

extension CommitListViewController: CommitTableViewCellDelegate {
    func detailedLabelTapped(labelText: String) {
        detailLabel.text = labelText
        
        let hide = viewModel.isDetailedViewHidden()
        
        overlayView.isHidden = hide
        detailLabel.isHidden = hide
    }
}
