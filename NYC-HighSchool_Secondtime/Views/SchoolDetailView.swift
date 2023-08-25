//
//  SchoolDetailView.swift
//  NYC-HighSchool_Secondtime
//
//  Created by naeem alabboodi on 8/25/23.
//

import SwiftUI

struct SchoolDetailView: View {
    let school : School
    var body: some View {
        VStack {
            Form {
                VStack {
                    Text(school.dbn)
                        .foregroundStyle(Color.purple)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                    VStack {
                        Text("School Name: ")
                            .foregroundStyle(Color.mint)
                        Text(school.schoolName)
                    }
                    .foregroundColor(Color.blue)
                    .font(.headline)
                    .bold()
                    .multilineTextAlignment(.center)
                    Divider()
                        .background(Color.blue)
                           .padding(0)
                    Section {
                        Divider()
                            .background(Color.blue)
                               .padding(0)
                        HStack {
                            Text("Sat Writing Avg Score: ")
                                .foregroundColor(Color.red)
                            Spacer()
                            Text(school.satWritingAvgScore)
                                .foregroundColor(Color.blue)
                        }
                        Divider()
                        HStack {
                            Text("Num Of Sat Test Takers: ")
                                .foregroundColor(Color.red)
                            Spacer()
                            Text(school.numOfSatTestTakers)
                                .foregroundColor(Color.blue)
                        }
                        Divider()
                        HStack {
                            Text("Sat Math Avg Score: ")
                                .foregroundColor(Color.red)
                            Spacer()
                            Text(school.satMathAvgScore)
                                .foregroundColor(Color.blue)
                        }
                        Divider()
                        HStack {
                            Text("Sat Writing Avg Score: ")
                                .foregroundColor(Color.red)
                            Spacer()
                            Text(school.satWritingAvgScore)
                                .foregroundColor(Color.blue)
                        }
                        .multilineTextAlignment(.leading)
                    }
                }
            }
        }
    }
}

//#Preview {
//    SchoolDetailView()
//}
