//
//  ContentView.swift
//  MVVMSwiftUI
//
//  Created by Алина Ражева on 08.12.2022.
//

import SwiftUI

struct CourseListView: View {
    @StateObject private var viewModel: CourseListViewModelProtocol = CourseListViewModel()
    var body: some View {
        NavigationView {
           ScrollView {
               ForEach(viewModel.courses, id: \.name) { course in
                   Text(course.name)
               }
            }
           .navigationBarTitle("Courses")
           .navigationBarItems(trailing: Button("Fetch Data", action: viewModel.fetchCourses))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
