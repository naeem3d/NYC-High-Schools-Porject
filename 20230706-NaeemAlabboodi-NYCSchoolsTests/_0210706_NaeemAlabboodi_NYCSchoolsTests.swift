//
//  _0230706_NaeemAlabboodi_NYCSchoolsTests.swift
//  20230706-NaeemAlabboodi-NYCSchoolsTests
//
//  Created by MAC on 08/07/23.
//

import XCTest
@testable import _0210706_NaeemAlabboodi_NYCSchools

class _0210706_NaeemAlabboodi_NYCSchoolsTests: XCTestCase {

    
    let vc = ListHighSchoolViewController()
    let service = MockService()
    var vm :ListHighSchoolViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        vm = ListHighSchoolViewModel(delegate:vc, service: service)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testFetchHighSchoolData() {
        
        service.responseFileName = "response"
        vm.fetchHighScollList()
        
        XCTAssertEqual(vm.numberOfItems, 440)
    }
   

}
