//
//  SchoolDetailView.swift
//  NYC_HighSchoolsSwiftUI
//
//  Created by naeem alabboodi on 8/24/23.
//

import SwiftUI

struct SchoolDetailView: View {
    let school: School
    
    var body: some View {
        VStack {
            Form {
                VStack(alignment: .center) {
                    Text(school.dbn ?? "unknow")
                        .foregroundStyle(Color.purple)
                        .font(.title)
                        .bold()
                    
                    VStack {
                        Text("School Name")
                            .foregroundStyle(Color.mint)
                        Text(school.schoolName ?? "unknow")
                            
                    }.foregroundStyle(Color.blue)
                        .font(.headline)
                        .bold()
                    .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                
                Section {
                    VStack {
                        
                        VStack {
                            Text("city")
                                .foregroundStyle(Color.red)
                            Text(school.city ?? "unknow")
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        Divider()
                        VStack(alignment: .center) {
                            Text("admissionspriority11")
                                .foregroundStyle(Color.red)
                            Text(school.admissionspriority11 ?? "")
                        }
                        Divider()
                        VStack(alignment: .center) {
                            Text("academicopportunities2")
                                .foregroundStyle(Color.red)
                            Text(school.academicopportunities2 ?? "")
                                .multilineTextAlignment(.center)
                        }
                        VStack(alignment: .center) {
                            Text("admissionspriority11")
                                .foregroundStyle(Color.red)
                            Text(school.admissionspriority11 ?? "")
                        }
                        Divider()
                        VStack(alignment: .center) {
                            Text("admissionspriority21")
                                .foregroundStyle(Color.red)
                            Text(school.admissionspriority21 ?? "")
                        }
                        Divider()
                        VStack(alignment: .center) {
                            Text("admissionspriority31")
                                .foregroundStyle(Color.red)
                            Text(school.admissionspriority31 ?? "")
                        }
                        Divider()
                        VStack(alignment: .center) {
                            Text("attendanceRate")
                                .foregroundStyle(Color.red)
                            Text(school.attendanceRate ?? "")
                        }
                        Divider()
                    }
                    .frame(maxWidth: .infinity)
                }
                Section {
                    VStack(alignment: .center) {
                        VStack {
                            Text("bbl")
                                .foregroundStyle(Color.purple)
                            Text(school.bbl ?? "unknow")
                        }
                        Divider()
                        VStack {
                            Text("bin")
                                .foregroundStyle(Color.purple)
                            Text(school.bin ?? "")
                        }
                        Divider()
                        VStack {
                            Text("boro")
                                .foregroundStyle(Color.purple)
                            Text(school.boro ?? "")
                        }
                        Divider()
                        VStack {
                            Text("borough")
                                .foregroundStyle(Color.purple)
                            Text(school.borough ?? "")
                        }
                        Divider()
                        VStack {
                            Text("buildingCode")
                                .foregroundStyle(Color.purple)
                            Text(school.buildingCode ?? "")
                        }
                        Divider()
                        VStack {
                            Text("Bus")
                                .foregroundStyle(Color.purple)
                            Text(school.bus ?? "")
                                .multilineTextAlignment(.center)
                        }
                        Divider()
                        VStack {
                            Text("censusTract")
                                .foregroundStyle(Color.purple)
                            Text(school.censusTract ?? "")
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                Section {
                    VStack {
                        VStack {
                            Text("Seats 101")
                                .foregroundStyle(Color.cyan)
                            Text(school.seats101 ?? "unknow")
                        }
                        Divider()
                        VStack {
                            Text("Seats 9Swd1")
                                .foregroundStyle(Color.cyan)
                            Text(school.seats9Swd1 ?? "")
                        }
                        Divider()
                        VStack {
                            Text("State Code")
                                .foregroundStyle(Color.cyan)
                            Text((school.stateCode ?? ""))
                        }
                        Divider()
                        VStack {
                            Text("Subway")
                                .foregroundStyle(Color.cyan)
                            Text( (school.subway ?? ""))
                                .multilineTextAlignment(.center)
                        }
                        Divider()
                        VStack(alignment: .center) {
                            Text("Total Students: " )
                                .foregroundStyle(Color.cyan)
                            Text(school.totalStudents ?? "")
                        }
                        Divider()
                        VStack(alignment: .center) {
                            Text("Website: " )
                                .foregroundStyle(Color.cyan)
                            Text(school.website ?? "")
                        }
                        Divider()
                        VStack(alignment: .center) {
                            Text("ZIP : " )
                                .foregroundStyle(Color.cyan)
                            Text(school.zip ?? "")
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct SchoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDetailView(school: School(dbn: "1", schoolName: "Test School Name ", boro: "boro", overviewParagraph: "overviewParagraph", school10ThSeats: "school10ThSeats", academicopportunities1: "academicopportunities1", academicopportunities2: "academicopportunities2", ellPrograms: "ellPrograms", neighborhood: "neighborhood", buildingCode: "buildingCode", location: "location", phoneNumber: "555555555", faxNumber: "faxNumber", schoolEmail: "schoolEmail", website: "website", subway: "subway", bus: "bus", grades2018: "grades2018", finalgrades: "finalgrades", totalStudents: "totalStudents", extracurricularActivities: "extracurricularActivities", schoolSports: "schoolSports", attendanceRate: "attendanceRate", pctStuEnoughVariety: "pctStuEnoughVariety", pctStuSafe: "pctStuSafe", schoolAccessibilityDescription: "school Accessibility Description", directions1: "directions1", requirement11: "requirement11", requirement21: "requirement21", requirement31: "requirement31", requirement41: "requirement41", requirement51: "requirement51", offerRate1: "offerRate1", program1: "program1", code1: "code1", interest1: "interest1", method1: "method1", seats9Ge1: "seats9Ge1", grade9Gefilledflag1: "grade9Gefilledflag1", grade9Geapplicants1: "grade9Geapplicants1", seats9Swd1: "seats9Swd1", grade9Swdfilledflag1: "grade9Swdfilledflag1", grade9Swdapplicants1: "grade9Swdapplicants1", seats101: "seats101", admissionspriority11: "Priority 11", admissionspriority21: "admissionspriority21", admissionspriority31: "admissionspriority31", grade9Geapplicantsperseat1: "grade9Geapplicantsperseat1", grade9Swdapplicantsperseat1: "grade9Swdapplicantsperseat1", primaryAddressLine1: "primaryAddressLine1", city: "Unkown", zip: "zip", stateCode: "Unkown", latitude: "latitude", longitude: "longitude", communityBoard: "communityBoard", councilDistrict: "councilDistrict", censusTract: "censusTract", bin: "bin", bbl: "bbl", nta: "nta", borough: "borough", name: "name", founded: 10, members: ["members1","members2"]))
    }
}
