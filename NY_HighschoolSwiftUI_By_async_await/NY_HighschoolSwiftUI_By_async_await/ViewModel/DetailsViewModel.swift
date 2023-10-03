//
//  DetailsViewModel.swift
//  Test
//
//  Created by naeem alabboodi on 10/2/23.
//

import Foundation
class DetailsViewModel: ObservableObject {
    @Published var detailshighSchool : [DetailsHighSchoolModel] = []
    var dbn : String
    init(dbn: String) {
        self.dbn = dbn
        Task {
            await loadData(dbn: dbn)
        }
    }
    
    @MainActor
    func loadData(dbn: String) async {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)") else { return  }
        detailshighSchool = await WebService().getDetails(url: url)
    }
}
