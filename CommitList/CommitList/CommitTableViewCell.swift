//
//  CommitTableViewCell.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import UIKit

class CommitTableViewCell: UITableViewCell {
    static var identifier = "CommitTableViewCell"
    
    weak var delegate: CommitTableViewCellDelegate?
    var viewModel: CommitCellModelProtocol?
    
    lazy var shadowContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 1
        view.layer.cornerRadius = 3
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        // TODO: Remove with vm
        label.text = "test"
        
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.italicSystemFont(ofSize: 12)
        // TODO: Remove with vm
        label.text = "test"
        
        return label
    }()
    
    lazy var hashLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        // TODO: Remove with vm
        label.text = "test"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        selectionStyle = .none
        contentView.backgroundColor = .white
        
        contentView.addSubview(shadowContainerView)
        shadowContainerView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(hashLabel)
        
        shadowContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        shadowContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        shadowContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        shadowContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        containerView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        
        messageLabel.leadingAnchor.constraint(equalTo: hashLabel.leadingAnchor).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3).isActive = true
        
        hashLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        hashLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        hashLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 10).isActive = true
        hashLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
    
    func configure(cellDelegate: CommitTableViewCellDelegate?, cellModel: CommitCellModelProtocol) {
        // TODO: build out in view model branch
        delegate = cellDelegate
        viewModel = cellModel
        
        guard let viewModel = viewModel else {
            return
        }
        
        nameLabel.text = viewModel.nameLabelText
        hashLabel.text = viewModel.hashLabelText
        messageLabel.text = viewModel.messageLabelText
    }
    
    @objc func detailedLabelTapped(label: UILabel) {
        delegate?.detailedLabelTapped(labelText: label.text ?? "failed to unwrap")
    }
}
