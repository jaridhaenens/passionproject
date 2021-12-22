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
    if let path = Bundle.main.path(forResource: "gravensteen", ofType: "mp3") {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.prepareToPlay()
            
        } catch {
            print("ERROR")
        }
    }
}

struct ViewpointView: View {
    
    var chapter: Chapter
    
    @State private var audioLoaded = false
    @State private var audioActive = true
    
    
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                GeometryReader { geometry in ScrollView{
                    Image(chapter.image)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .cornerRadius(5)
                    
                    Spacer()
                    
                    Text("Hoofdstuk \(chapter.chapterId, specifier: "%.0f"): \(chapter.name)")
                        .font(.custom("Gilroy-ExtraBold", size: 25))
                        .foregroundColor(Color("titleColor"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                 
                        Text(chapter.text)
                            .font(.custom("Poppins-Regular", size: 16))
                            .tracking(0.6)
                            .foregroundColor(Color("textColor"))
                            .lineSpacing(2)
                            .frame(
                                minWidth: geometry.size.width,
                                idealWidth: geometry.size.width,
                                maxWidth: geometry.size.width,
                                minHeight: geometry.size.height,
                                idealHeight: geometry.size.height,
                                maxHeight: .infinity,
                                alignment: .topLeading)
                
                   
                    
                    
                    //            Toggle("Show welcome message", isOn: $audioActive)
                    
                    
                    Text("Breng de stad tot leven")
                        .font(.custom("Gilroy-ExtraBold", size: 19))
                        .foregroundColor(Color("titleColor"))
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, -30)
                    
                    NavigationLink(destination: aiWithCameraView(chapter: chapter, imageClassifier: ImageClassifier(), confidenceClassifier: ConfidenceClassifier()).onAppear(){audioPlayer?.pause()}){
                        
                        FindImageView(chapter: chapter)
                            .background(Color("darkColor"))
                            .cornerRadius(5)
                    }
                    .padding(.bottom, 10)
                    
                    
                }}
            }
            
            .padding(.horizontal)
            
            
            VStack {
                
                Spacer()
                
                if audioActive {
                    Button(action: {
                    
                        audioPlayer?.pause()
                        
                        audioActive = false
                    }) {
                        Image(systemName: "pause.fill")
                            .frame(width: 70, height: 70)
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color.black, lineWidth: 3)
                                
                            )
                            
                            .background(Color.white)
                            .foregroundColor(Color.black)
                            
                            .cornerRadius(100)
                    }
                    .shadow(radius: 2)
                    .font(.title)
                } else {
                    Button(action: {
            
                        
                        if audioLoaded {
                            audioPlayer?.play()
                        } else {
                            loadAudio(sound: "gravensteen", type: "mp3")
                            audioPlayer?.play()
                            audioLoaded = true
                        }
                        
                        audioActive = true
                    }) {
                        Image(systemName: "play.fill")
                            .frame(width: 70, height: 70)
                            .cornerRadius(100)
                            //                            .border(Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .foregroundColor(Color.black)
                            .background(Color.white)
                            .cornerRadius(100)
                    }
                    .shadow(radius: 2)
                    .font(.title)
                }
                
            }
        }
        .onDisappear(){audioPlayer?.pause()}
    }
}

//struct ViewpointView_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewpointView()
//    }
//}
