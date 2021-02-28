//
//  Author.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import Foundation

struct Author: Codable {
    var authorPortraitUrl: String
    
    enum KeyValue: String {
        case authorPortraitUrl = "avatar_url"
    }
    
    init(json: [String: Any]) {
        authorPortraitUrl = json[KeyValue.authorPortraitUrl.rawValue] as? String ?? ""
    }
}
