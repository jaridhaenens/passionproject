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

    func getDataChapter(tourId: String, chapterId: Double) {
        
        // Get a reference to the database
        print(tourId)
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
                                text: d["text"] as? String ?? ""
                            )
                        }
                    }
                    
                    
                }
            }
            else {
                // Handle the error
            }
        }
        
        // working for name only:
//        docRef.getDocument { (document, error) in
//            guard error == nil else {
//                print("error", error ?? "")
//                return
//            }
//
//            if let document = document, document.exists {
//                let data = document.data()
//                if let data = data {
//                    print("data", data)
//                    self.chapterItem = data["name"] as? String ?? ""
//                }
//            }
//
//        }
        
        
        
    }

}
