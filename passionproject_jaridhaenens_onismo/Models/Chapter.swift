//
//  FirebaseModel.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 16/12/2021.
//

import FirebaseFirestore
import Firebase

struct Chapter: Identifiable {
    
    var id: String
    
    var chapterId: Double
    var latitude: Double
    var longitude: Double
    var name: String
    var text: String
//    var models: [String]
    var object: String
    var image: String
    var description: String
    var imageAi: String

}

struct ChapterObject: Identifiable {
    var id: String = UUID().uuidString
    var modelName: String
}
