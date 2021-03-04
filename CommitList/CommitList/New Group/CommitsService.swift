//
//  CommitsService.swift
//  CommitList
//
//  Created by Tristan Newman on 2/28/21
//

import Foundation
import Alamofire

class CommitsService: CommitsServiceProtocol {
    let baseURLString = "https://api.github.com/repos/tristanbnewman/WorkoutsMap"
    let getCommitsExtension = "/commits"
    
    func getCommits(completion: @escaping (Result<Any, AFError>) -> Void) {
        let requestUrlString = baseURLString + getCommitsExtension
        
        AF.request(requestUrlString).validate().responseJSON { (response) in
            completion(response.result)
        }
    }
    
    
}
