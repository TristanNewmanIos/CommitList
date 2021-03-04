//
//  MockCommitsService.swift
//  CommitListTests
//
//  Created by Tristan Newman on 3/3/21.
//

import XCTest
import Alamofire
@testable import CommitList

class MockCommitsService: CommitsService {
    func testGetCommits(completion: () -> Void) {
        completion()
    }
}
