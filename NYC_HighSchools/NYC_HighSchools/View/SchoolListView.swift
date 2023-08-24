//
//  SchoolListView.swift
//  NYC_HighSchools
//
//  Created by naeem alabboodi on 8/24/23.
//

// In this file will create SwiftUI views to display school list and details.

import SwiftUI

struct SchoolListView: View {
    @ObservedObject var viewModel = SchoolsViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.schools) { school in
                NavigationLink(destination: SchoolDetailView(school: school)) {
                    Text(school.schoolName ?? "unknown")
                        .foregroundStyle(Color.blue)
                }
            }
            .navigationTitle("NYC-High School List")
        } .onAppear {
            viewModel.fetchSchools()
        }
    }
}


struct SchoolListView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolListView()
    }
}
