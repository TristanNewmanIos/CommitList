//
//  Commit.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import Foundation

struct Commit: Codable {
    var authorName: String
    var authorPortraitURL: URL
    var commitHash: String
    var commitMessage: String
    
}
