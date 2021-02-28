//
//  CommitsResponseObject.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import Foundation

struct CommitsResponseObject {
    var commits: [Commit]
    
    init(json: Any?) {
        commits = []
    }
}
