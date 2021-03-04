//
//  CommitListViewModelTests.swift
//  CommitListTests
//
//  Created by Tristan Newman on 2/28/21.
//

import XCTest
@testable import CommitList

class CommitListViewModelTests: XCTestCase {
    var viewModel = CommitListViewModel()
    var mockCommitsService = MockCommitsService()
    
    func testViewDidLoad() {
        // Tests if service is called from viewDidLoad method
        let expectation = self.expectation(description: "getCommits")
        
        mockCommitsService.testGetCommits(completion: {
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertTrue(expectation.expectedFulfillmentCount == 1)
    }
    
    func testNumberOfRows() {
        viewModel.cellModels.append(CommitCellViewModel(nameLabelText: "Name", hashLabelText: "hash", messageLabelText: "message", imageUrlString: "www.google.com"))
        XCTAssert(viewModel.numberOfRows() == 1)
    }
    
    func testCellModel() {
        let testCellModel = CommitCellViewModel(nameLabelText: "name", hashLabelText: "hash", messageLabelText: "message", imageUrlString: "www.google.com")
        let testIndexPath = IndexPath(row: 0, section: 0)
        viewModel.cellModels.append(CommitCellViewModel(nameLabelText: "name", hashLabelText: "hash", messageLabelText: "message", imageUrlString: "www.google.com"))
        XCTAssert(testCellModel.hashLabelText == viewModel.cellModel(indexPath: testIndexPath).hashLabelText &&
                    testCellModel.nameLabelText == viewModel.cellModel(indexPath: testIndexPath).nameLabelText &&
                    testCellModel.imageUrl == viewModel.cellModel(indexPath: testIndexPath).imageUrl &&
                    testCellModel.messageLabelText == viewModel.cellModel(indexPath: testIndexPath).messageLabelText)
    }
    
    func testIsDetailViewHidden() {
        let isDetailLabelHidden = viewModel.isDetailLabelHidden
        XCTAssertFalse(isDetailLabelHidden == viewModel.isDetailedViewHidden())
    }
}
