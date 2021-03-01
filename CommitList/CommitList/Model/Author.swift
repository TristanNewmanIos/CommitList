//
//  Author.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import Foundation

struct Author: Codable {
    var portraitUrlString: String
    
    enum KeyValue: String {
        case portraitUrlString = "avatar_url"
    }
    
    init(json: [String: Any]) {
        portraitUrlString = json[KeyValue.portraitUrlString.rawValue] as? String ?? ""
    }
}
