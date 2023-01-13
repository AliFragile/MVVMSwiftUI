//
//  CourseListViewModel.swift
//  MVVMSwiftUI
//
//  Created by Алина Ражева on 08.12.2022.
//

import Foundation

protocol CourseListViewModelProtocol {
    var rows: [CourseDetailsViewModel] { get }
    func fetchCourses()
}

class CourseListViewModel: CourseListViewModelProtocol, ObservableObject {
    @Published var rows: [CourseDetailsViewModel] = []   //Published - получатели событий
    
    //здесь делаем сетевой запрос через NetworkManager
    func fetchCourses() {
        NetworkManager.shared.fetchCourses { courses in
            courses.forEach { [unowned self] course in  //сделали лист захвата, поэтому self не нужно писать
                let courseDetailsViewModel = CourseDetailsViewModel(course: course)
                rows.append(courseDetailsViewModel)
            }
        }
    }
}
