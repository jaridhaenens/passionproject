////
////  ViewModel.swift
////  passionproject_jaridhaenens_onismo
////
////  Created by Jari D'haenens on 16/12/2021.
////
//
import Foundation
import Firebase

class ChapterModelView: ObservableObject {
//
    @Published var chapterItem = [Chapter]()
//    @Published var chapterAmount = 0

    func getDataChapter(tourId: String, chapterId: Double) {
        
        // Get a reference to the database
        print(chapterId)
        let db = Firestore.firestore()
        let docRef = db.collection("tours").document(tourId).collection("chapters").whereField("chapterId", isEqualTo: chapterId)
        
        docRef.getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Todos
                        self.chapterItem = snapshot.documents.map { d in
                            
                            // Create a Todo item for each document returned
                            return Chapter(
                                id: d.documentID,
                                chapterId: d["chapterId"] as? Double ?? 0.0,
                                latitude: d["latitude"] as? Double ?? 0.0,
                                longitude: d["longitude"] as? Double ?? 0.0,
                                name: d["name"] as? String ?? "",
                                text: d["text"] as? String ?? "",
//                                models: d["models"] as? [String] ?? ["toy_drummer"],
                                object: d["object"] as? String ?? "",
                                image: d["image"] as? String ?? "",
                                description: d["description"] as? String ?? "",
                                imageAi: d["image-ai"] as? String ?? ""
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

}
