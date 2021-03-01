//
//  Commit.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import Foundation

struct Commit: Codable {
    var commitDetails: CommitDetails
    var author: Author
    var commitHash: String
    
    enum KeyValue: String {
        case commitDetails = "commit"
        case author
        case commitHash = "sha"
    }
    
    init(json: [String: Any]) {
        commitDetails = CommitDetails(json: json[KeyValue.commitDetails.rawValue] as? [String: Any] ?? [:])
        author = Author(json: json[KeyValue.author.rawValue] as? [String: Any] ?? [:])
        commitHash = json[KeyValue.commitHash.rawValue] as? String ?? ""
    }
}
