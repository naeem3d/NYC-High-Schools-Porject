//
//  NY_HighschoolSwiftUI_By_async_awaitTests.swift
//  NY_HighschoolSwiftUI_By_async_awaitTests
//
//  Created by naeem alabboodi on 10/3/23.
//

import XCTest
@testable import NY_HighschoolSwiftUI_By_async_await

final class NY_HighschoolSwiftUI_By_async_awaitTests: XCTestCase {
    var viewModel: HighSchoolViewModel!
    override func setUpWithError() throws {
        // Create a mock service and inject it into the view model
        let mockService = MockServices(responseFile: "MockData")
        viewModel = HighSchoolViewModel(webService: mockService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   
    
    func test_HighSchoolViewModel_highSchoolList_notNil () async {
           await viewModel.loadData()

           // Check if highSchoolList is not nil
           XCTAssertNotNil(viewModel.highSchoolList)
       }

}
