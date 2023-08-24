//
//  SchoolsViewModel.swift
//  NYC_HighSchools
//
//  Created by naeem alabboodi on 8/24/23.
//

import Foundation
// At this file Fetch and manage the data for my views.
class SchoolsViewModel: ObservableObject {
    @Published var schools: [School] = []
    @Published var errorMessage: String?
    
    private var apiService = APIService()

    func fetchSchools() {
        Task {
            do {
                let fetchedSchools = try await apiService.fetchSchools()
                DispatchQueue.main.async {
                    self.schools = fetchedSchools
                }
            } catch let error as APIServiceError {
                DispatchQueue.main.async {
                    switch error {
                    case .invalidURL:
                        self.errorMessage = "Invalid URL."
                    case .decodingError:
                        self.errorMessage = "Failed to decode data."
                    case .serverError(let serverError):
                        self.errorMessage = "Server error: \(serverError.localizedDescription)"
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Unknown error occurred."
                }
            }
        }
    }
}
