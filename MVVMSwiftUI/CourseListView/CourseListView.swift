//
//  ContentView.swift
//  MVVMSwiftUI
//
//  Created by Алина Ражева on 08.12.2022.
//

import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel = CourseListViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.rows, id: \.courseName) { courseDetailsViewModel in
                NavigationLink(destination: CourseDetailsView(viewModel: courseDetailsViewModel)) {
                    RowView(viewModel: courseDetailsViewModel)
                }
            }
        .navigationBarTitle("Courses")
        }
        .onAppear {
            viewModel.fetchCourses()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
