//
//  CommitsResponseObject.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import Foundation

struct CommitsResponseObject {
    var commits = [Commit]()
    
    init(json: Any?) {
        let dataArray = json as? [[String: Any]]
        
        dataArray?.forEach {
            commits.append(Commit(json: $0))
        }
        
//        commits = []
    }
}
