//
//  ProgressModel.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 19/12/2021.
//

import Foundation

class ProgressModel: ObservableObject {
    @Published var currentChapter:Double = 1
    @Published var modelSaved:Bool = false
    @Published var numChapters: Int = 0
    @Published var lastChapter: Bool = false
    @Published var capturedModels: Array = [""]
    
    
    func nextChapter() {
        currentChapter += 1
    }
}
