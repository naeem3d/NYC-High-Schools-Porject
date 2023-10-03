//
//  MockServices.swift
//  Test
//
//  Created by naeem alabboodi on 10/2/23.
//

import Foundation

class MockServices: Service {
    var responseFile = ""

    init(responseFile: String) {
        self.responseFile = responseFile
    }

    func getHighSchoolList(url: URL) async throws -> [HighSchoolModel] {
        let bundle = Bundle(for: MockServices.self)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        guard let urlForResource = bundle.url(forResource: responseFile, withExtension: "json") else {
            print("Error: Resource not found")
            throw MyError.resourceNotFound
        }

        do {
            let data = try Data(contentsOf: urlForResource)
            let output = try decoder.decode([HighSchoolModel].self, from: data)
            return output
        } catch {
            print("Error decoding data: \(error)")
            throw MyError.resourceNotFound
        }
    }
}



enum MyError: Error {
    case resourceNotFound
    // Add more error cases as needed
}
