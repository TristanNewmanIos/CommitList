//
//  CommitDetails.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import Foundation

struct CommitDetails: Codable {
    var author: CommitAuthor
    var message: String
    
    enum KeyValue: String {
        case author
        case message
    }
    
    init(json: [String: Any]) {
        author = CommitAuthor(json: json[KeyValue.author.rawValue] as? [String: Any] ?? [:])
        message = json[KeyValue.message.rawValue] as? String ?? ""
    }
}
