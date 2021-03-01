//
//  CommitCellViewModel.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import Foundation

class CommitCellViewModel: CommitCellModelProtocol {
    var nameLabelText: String
    var hashLabelText: String
    var messageLabelText: String
    var imageUrl: URL?
    
    init(nameLabelText: String, hashLabelText: String, messageLabelText: String, imageUrlString: String) {
        self.nameLabelText = nameLabelText
        self.hashLabelText = hashLabelText
        self.messageLabelText = messageLabelText
        self.imageUrl = URL(string: imageUrlString)
    }
}
