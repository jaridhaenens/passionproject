//
//  ViewpointView.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 01/12/2021.
//

import SwiftUI
import AVFoundation


var audioPlayer: AVAudioPlayer?

func loadAudio(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: "christmas", ofType: "mp3") {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.prepareToPlay()
            
        } catch {
            print("ERROR")
        }
    }
}

struct ViewpointView: View {
    
    @State private var audioLoaded = false
    @State private var audioActive = true
    
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: aiWithCameraView(imageClassifier: ImageClassifier(), confidenceClassifier: ConfidenceClassifier())){
                
                FindImageView()
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
            }
            Spacer()
            Text("Chapter 1")
                .font(.custom("Gilroy-ExtraBold", size: 25))
                .foregroundColor(Color("titleColor"))
                .padding(.vertical)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam rhoncus dolor vel vitae nisi, ut. Sit turpis sed mattis egestas tempor odio. Maecenas cursus nunc nibh augue vivamus fusce proin amet rhoncus. Blandit vel neque aliquam sem quis laoreet sit turpis cras. Auctor velit quisque amet, massa lorem enim. Sit felis turpis nullam gravida. Sed commodo nec nibh sagittis at et. Volutpat aliquet id egestas ac dui. Sed aliquam sed egestas elit semper viverra fringilla nibh.")
                .font(.custom("Poppins-Regular", size: 16))
                .tracking(0.6)
                .foregroundColor(Color("textColor"))
                .lineSpacing(2)
            
            
            //            Toggle("Show welcome message", isOn: $audioActive)
            
            if audioActive {
                Button(action: {
                    //                    playSound(sound: "christmas", type: "mp3")
                    audioPlayer?.pause()
                    
                    audioActive = false
                }) {
                    Image(systemName: "pause.fill")
                }
            } else {
                Button(action: {
                    //                    playSound(sound: "christmas", type: "mp3")
                    
                    if audioLoaded {
                        audioPlayer?.play()
                    } else {
                        loadAudio(sound: "christmas", type: "mp3")
                        audioPlayer?.play()
                        audioLoaded = true
                    }
                    
                    audioActive = true
                }) {
                    Image(systemName: "play.fill")
                }
            }
        }
        
        .padding(.all)
    }
}

struct ViewpointView_Previews: PreviewProvider {
    static var previews: some View {
        ViewpointView()
    }
}
