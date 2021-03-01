//
//  Author.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21.
//

import Foundation

struct Author: Codable {
    var imageUrlString: String
    
    enum KeyValue: String {
        case imageUrlString = "avatar_url"
    }
    
    init(json: [String: Any]) {
        imageUrlString = json[KeyValue.imageUrlString.rawValue] as? String ?? ""
    }
}
