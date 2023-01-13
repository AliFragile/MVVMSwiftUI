//
//  CourseImage.swift
//  MVVMSwiftUI
//
//  Created by Алина Ражева on 12.01.2023.
//

import SwiftUI

//MARK: - Работа с картинкой

struct CourseImage: View {
    let imageData: Data?
    //на главном и детальных экранах эти параметры будут разными по величине, поэтому делаем дальнейшую корректировку
    let imageSize: CGSize
    let cornerRadius: CGFloat
    let shadowIsOn: Bool
    
    var body: some View {
        getImage(from: imageData)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowIsOn ? 10 : 0)
    }
    
    //в swiftUI нет инициализатора, чтобы бы могли инициализировать изображение на основе Data, такое есть только в UIKit
    private func getImage(from data: Data?) -> Image {
        guard let data = data else { return Image(systemName: "xmark.shield")}  //если будет что-то не то с изображением, то будет показываться системное
        //инициализируем изображение на основе Data
        guard let image = UIImage(data: data) else { return Image(systemName: "xmark.shield")}
        return Image(uiImage: image)
    }
}

struct CourseImage_Previews: PreviewProvider {
    static var previews: some View {
        CourseImage(
            imageData: nil,
            imageSize: CGSize(width: 230, height: 180),
            cornerRadius: 30,
            shadowIsOn: true
        )
    }
}
