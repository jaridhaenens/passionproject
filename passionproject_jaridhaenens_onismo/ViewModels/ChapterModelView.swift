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
//        let amountRef = db.collection("tours").document(tourId).collection("chapters")
        
//        amountRef.getDocuments{snapshot, error in
//
//            self.chapterAmount = snapshot!.count
////            print(self.chapterAmount)
//
//        }
        
//        amountRef.getDocuments{
//            (querySnapshot, err) in
//
//            if let err = err
//            {
//                print("Error getting documents: \(err)");
//            }
//            else
//            {
//                var count = 0
//                for document in querySnapshot!.documents {
//                    count += 1
//                    print("\(document.documentID) => \(document.data())");
//                }
//
//                print("Count = \(count)");
//            }
//        }
        
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
