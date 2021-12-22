//
//  DetailView.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 22/12/2021.
//

import SwiftUI

struct DetailView: View {
    
    var chapter: Chapter
    @ObservedObject var progressModel: ProgressModel
    
    var body: some View {
        if progressModel.lastChapter {
            
        } else {
            aiWithCameraView(chapter: chapter, imageClassifier: ImageClassifier(), confidenceClassifier: ConfidenceClassifier())
        }
    }
}
