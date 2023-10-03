//
//  SchoolListView.swift
//  NYC-HighSchool_Secondtime
//
//  Created by naeem alabboodi on 8/25/23.
//

import SwiftUI
//test
struct SchoolListView: View {
    @ObservedObject var viewModel = SchoolsViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.schools) { school in
                
                NavigationLink {
                    SchoolDetailView(school: school)
                } label: {
                    Text(school.schoolName )
                        .foregroundStyle(Color.blue)
                    
                }

            }
            .navigationTitle("NYC High School List")
//            .navigationBarTitleDisplayMode(.inline)
           
            
        }
        .onAppear {
            viewModel.fetchSchools()
        }
       
    }
}

#Preview {
    SchoolListView()
}

struct Title: View  {
    var body: some View {
        Text("NYC High School List")
            .foregroundStyle(.red)
            .font(.title2)
            .bold()
    }
}
