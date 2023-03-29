//
//  PhotoGallery.swift
//  Navigation
//
//  Created by Николай Гринько on 28.02.2023.
//

import UIKit

struct PhotoGallery {

    static func setupGallery() -> [ImageGallery] {
        [
            .init(id: 1, imageName: "1"),
            .init(id: 2, imageName: "2"),
            .init(id: 3, imageName: "3"),
            .init(id: 4, imageName: "4"),
            .init(id: 5, imageName: "5"),
            .init(id: 6, imageName: "6"),
            .init(id: 7, imageName: "7"),
            .init(id: 8, imageName: "8"),
            .init(id: 9, imageName: "9"),
            .init(id: 10, imageName: "10"),
            
            .init(id: 11, imageName: "11"),
            .init(id: 12, imageName: "12"),
            .init(id: 13, imageName: "13"),
            .init(id: 14, imageName: "14"),
            .init(id: 15, imageName: "15"),
            .init(id: 16, imageName: "16"),
            .init(id: 17, imageName: "17"),
            .init(id: 18, imageName: "18"),
            .init(id: 19, imageName: "19"),
            .init(id: 20, imageName: "20"),
            
            .init(id: 21, imageName: "21"),
            .init(id: 22, imageName: "22"),
            .init(id: 23, imageName: "23"),
            .init(id: 24, imageName: "24"),
            .init(id: 25, imageName: "25"),
            .init(id: 26, imageName: "26"),
            .init(id: 27, imageName: "27"),
            .init(id: 28, imageName: "28"),
            .init(id: 29, imageName: "29"),
            .init(id: 30, imageName: "30"),
            
            .init(id: 31, imageName: "31"),
            .init(id: 32, imageName: "32"),
            .init(id: 33, imageName: "33")
        ]
    }

    static func randomPhotos(with count: Int) -> [ImageGallery] {
//        let array = setupGallery().
        return (0..<count).map { index in
            //print("xxx \(index)")
            return setupGallery().randomElement()! }
    }
    
    static func photos(with index: Int) -> ImageGallery {
        let array = setupGallery()
        return  array[index]
    }
}

struct ImageGallery {
    let id: Int
    let imageName: String
}

struct SectionPhoto {
    let sectionName: String
    var photos: [ImageGallery]
}
