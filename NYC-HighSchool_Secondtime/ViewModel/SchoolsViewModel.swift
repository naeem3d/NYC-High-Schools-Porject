//
//  SchoolsViewModel.swift
//  NYC-HighSchool_Secondtime
//
//  Created by naeem alabboodi on 8/25/23.
//

import SwiftUI

// At this file i will fetch and manage data for my views

class SchoolsViewModel: ObservableObject {
    @Published var schools : [School] = []
    @Published var errorMessage: String?
    
    private var apiService = APIServces()
    
    func fetchSchools() {
        Task {
            do {
                let fetchSchools = try await apiService.fetchSchools()
                DispatchQueue.main.async {
                    self.schools = fetchSchools
                }
            } catch let error as APIServiceError {
                switch error {
                    
                case .invalidURL:
                    self.errorMessage = "Invalid URL"
                case .decoddingError:
                    self.errorMessage = "Failed to decode data."
                case .serverError(let serverError):
                    self.errorMessage = "server error :\(serverError.localizedDescription)"
                }
            }
        }
    }
    
    
}
