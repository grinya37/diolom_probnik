//
//  ProfileSectionModel.swift
//  Navigation
//
//  Created by Николай Гринько on 26.03.2023.
//

import Foundation

protocol IProfileSectionModel {}

struct PhotosModel: IProfileSectionModel {
    var photos: [String] = []
}
