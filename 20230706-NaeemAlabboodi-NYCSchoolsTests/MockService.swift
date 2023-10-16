//
//  MockService.swift
//  20230706-NaeemAlabboodi-NYCSchoolsTests
//
//  Created by MAC on 08/07/23.
//

import Foundation
@testable import _0210706_NaeemAlabboodi_NYCSchools

class MockService: Service {
    var responseFileName = ""

    func getHighSchoolList(url: URL, completion: @escaping ([HighSchoolModel]?) -> ()) {
        
        let bundle = Bundle(for:MockService.self)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let url = bundle.url(forResource:responseFileName, withExtension:"json"),
              let data = try? Data(contentsOf: url),
              let output = try? decoder.decode([HighSchoolModel].self, from: data)
        else {
            completion(nil)
            return
        }
        completion(output)
    }
}
