//
//  countChaptersModel.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 21/12/2021.
//

import Foundation
import Firebase

class CountChaptersModel: ObservableObject {
    
    @Published var chapterAmount:Double = 0
    
    func countChapters(tourId: String) {
        let db = Firestore.firestore()
        let amountRef = db.collection("tours").document(tourId).collection("chapters")
        
        
        amountRef.getDocuments{
            (querySnapshot, err) in
            
            if let err = err
            {
                print("Error getting documents: \(err)");
            }
            else
            {
//                var count = 0
                for document in querySnapshot!.documents {
                    self.chapterAmount += 1
//                    print("\(document.documentID) => \(document.data())");
                }
                
                print("Count = \(self.chapterAmount)");
            }
        }
    }
}
