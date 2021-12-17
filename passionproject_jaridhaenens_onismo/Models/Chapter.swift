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
    
    
//    init(snapshot: QueryDocumentSnapshot) {
//
//        guard let snapshotValue = snapshot else {return}
//        id = snapshot.documentID
////        var snapshotValue = snapshot.data()
//        latitude = snapshotValue["latitude"] as? Double
//        longitude = snapshotValue["longitude"] as? Double
//        name = snapshotValue["name"] as? String
//        text = snapshotValue["text"] as? String
//    }
}

