//
//  ContentView.swift
//  Test
//
//  Created by naeem alabboodi on 10/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm : HighSchoolViewModel
    @StateObject var details: DetailsViewModel
    @State var resultdetails : [DetailsHighSchoolModel] = []
    init(service: Service) {
        _vm = StateObject(wrappedValue: HighSchoolViewModel(webService: service as! WebService))
        _details = StateObject(wrappedValue: DetailsViewModel(dbn: ""))
    }
    var body: some View {
        NavigationStack {
            List {
                
                ForEach(vm.highSchoolList, id: \.dbn) { item in
                    
                    NavigationLink(destination: DetailsView(dbn: item.dbn)) {
                        HStack {
                            Text(item.schoolName)
                            Spacer()
                            Text(item.totalStudents)
                                .foregroundStyle(.cyan)
                        }
                    }
                    .task {
                        await  details.loadData(dbn: item.dbn)
                        resultdetails = details.detailshighSchool
                    }
                }
            }
            .navigationTitle("List HighSchools")
        }
        
        .task {
         await  vm.loadData()
            resultdetails =  details.detailshighSchool
        }
        .padding()
    }
}

#Preview {
    ContentView(service: WebService())
}

struct DetailsView: View {
    var dbn: String
    @StateObject var details: DetailsViewModel

    init(dbn: String) {
        self.dbn = dbn
        _details = StateObject(wrappedValue: DetailsViewModel(dbn: dbn))
    }

    var body: some View {
        List {
            VStack {
                VStack(alignment:.center){
                   
                    Text("\(details.detailshighSchool.first?.schoolName ?? "N/A")")
                        .foregroundStyle(.blue)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .bold()
                    
                }
                Divider()
                HStack{
                    Text("Number of SAT Test Takers:")
                    Spacer()
                    Text("\(details.detailshighSchool.first?.numOfSatTestTakers ?? "N/A")")
                        .foregroundStyle(.cyan)
                    
                }
                Divider()
                HStack {
                    Text("SAT Critical Reading Avg Score: ")
                    Spacer()
                    Text("\(details.detailshighSchool.first?.satCriticalReadingAvgScore ?? "N/A")")
                        .foregroundStyle(.cyan)
                }
                Divider()
                HStack {
                    Text("SAT Math Avg Score: ")
                    Spacer()
                    Text("\(details.detailshighSchool.first?.satMathAvgScore ?? "N/A")")
                        .foregroundStyle(.cyan)
                }
                Divider()
                HStack {
                    Text("SAT Writing Avg Score: ")
                    Spacer()
                    Text("\(details.detailshighSchool.first?.satWritingAvgScore ?? "N/A")")
                        .foregroundStyle(.cyan)
                }
             
            }
            .padding()
            .navigationBarTitle("High School Details", displayMode: .inline)
            .task {
                
               await details.loadData(dbn: dbn)
            }
            
        }
    }
}
