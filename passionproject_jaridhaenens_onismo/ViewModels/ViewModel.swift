//
//  ViewModel.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 16/12/2021.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    
    @Published var list = [Tour]()
//        @Published var chapterItem = [Chapter]()
//    @Published var chapterItem: String = ""
    
    func getData() {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("tours").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Todos
                        self.list = snapshot.documents.map { d in
                            
                            // Create a Todo item for each document returned
                            return Tour(id: d.documentID,
                                        city: d["city"] as? String ?? "",
                                        description: d["description"] as? String ?? "",
                                        image: d["image"] as? String ?? "",
                                        latitude: d["longitude"] as? Double ?? 0.0,
                                        longitude: d["longitude"] as? Double ?? 0.0,
                                        firstLocation: d["firstLoction"] as? String ?? ""
                                        //                                        chapters: d["chapters"] as? Identifiable as! Chapter
                            )
                        }
                    }
                    
                    
                }
            }
            else {
                // Handle the error
            }
        }
        
        
    }
    
//    func getDataChapter(tourId: String, chapterId: Double) {
//        
//        // Get a reference to the database
//        print(tourId)
//        let db = Firestore.firestore()
//        let docRef = db.collection("tours").document(tourId).collection("chapters").whereField("chapterId", isEqualTo: chapterId)
//        
//        docRef.getDocuments { snapshot, error in
//            
//            // Check for errors
//            if error == nil {
//                // No errors
//                
//                if let snapshot = snapshot {
//                    
//                    // Update the list property in the main thread
//                    DispatchQueue.main.async {
//                        
//                        // Get all the documents and create Todos
//                        self.chapterItem = snapshot.documents.map { d in
//                            
//                            // Create a Todo item for each document returned
//                            return Chapter(
//                                id: d.documentID as? String ?? "",
//                                chapterId: d["chapterId"] as? Double ?? 0.0,
//                                latitude: d["latitude"] as? Double ?? 0.0,
//                                longitude: d["longitude"] as? Double ?? 0.0,
//                                name: d["name"] as? String ?? "",
//                                text: d["text"] as? String ?? ""
//                            )
//                        }
//                    }
//                    
//                    
//                }
//            }
//            else {
//                // Handle the error
//            }
//        }
//        
//        // working for name only: 
////        docRef.getDocument { (document, error) in
////            guard error == nil else {
////                print("error", error ?? "")
////                return
////            }
////
////            if let document = document, document.exists {
////                let data = document.data()
////                if let data = data {
////                    print("data", data)
////                    self.chapterItem = data["name"] as? String ?? ""
////                }
////            }
////
////        }
//        
//        
//        
//    }
//
//}

//Chapter(
//                                        id: data["id"] as? String ?? "",
//                                        latitude: data["latitude"] as? Double ?? 0.0,
//                                        longitude: data["longitude"] as? Double ?? 0.0,
//                                        name: data["name"] as? String ?? "",
//                                        text: data["text"] as? String ?? ""
//                                    )
}
