//
//  CommitAuthor.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import Foundation

struct CommitAuthor: Codable {
    var name: String
    
    enum KeyValue: String {
        case name
    }
    
    init(json: [String: Any]) {
        name = json[KeyValue.name.rawValue] as? String ?? ""
    }
    
    init(name: String) {
        self.name = name
    }
}
