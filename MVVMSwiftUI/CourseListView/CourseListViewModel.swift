//
//  CourseListViewModel.swift
//  MVVMSwiftUI
//
//  Created by Алина Ражева on 08.12.2022.
//

import Foundation

protocol CourseListViewModelProtocol {
    var courses: [Course] { get }
    func fetchCourses()
}

class CourseListViewModel: CourseListViewModelProtocol, ObservableObject {
    @Published var courses: [Course] = []   //Published - получатели событий
    
    func fetchCourses() {
        NetworkManager.shared.fetchCourses { courses in
            self.courses = courses
        }
    }
    
    
}
