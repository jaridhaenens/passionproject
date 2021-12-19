//
//  ProgressModel.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 19/12/2021.
//

import Foundation

class ProgressModel: ObservableObject {
    @Published var currentChapter:Double = 1
    
    func nextChapter() {
        currentChapter += 1
    }
}
