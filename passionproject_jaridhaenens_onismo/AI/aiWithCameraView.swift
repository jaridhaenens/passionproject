
import SwiftUI

//var classifier = Classifier()

struct aiWithCameraView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @ObservedObject var imageClassifier: ImageClassifier
    @ObservedObject var confidenceClassifier: ConfidenceClassifier
    
    @EnvironmentObject var progressModel: ProgressModel
    
    var body: some View {
        
        VStack {
            VStack{
                HStack{
                    Image(systemName: "photo")
                        .onTapGesture {
                            isPresenting = true
                        }
                    Image(systemName: "camera")
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .camera
                        }
                }
                .font(.largeTitle)
                .foregroundColor(.blue)
                
                Rectangle()
                    .strokeBorder()
                    .foregroundColor(.yellow)
                    .overlay(
                        Group {
                            if uiImage != nil {
                                Image(uiImage: uiImage!)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    )
                
                
                
                VStack{
                    Button(action: {
                        if uiImage != nil {
                            imageClassifier.detect(uiImage: uiImage!)
                        }
                    }) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.orange)
                            .font(.title)
                    }
                    
                    
                    Group {
                        if let imageClass = imageClassifier.imageClass {
                            HStack{
                                Text("Image categories:")
                                    .font(.caption)
                                Text(imageClass)
                                    .bold()
                            }
                        } else {
                            HStack{
                                Text("Image categories: NA")
                                    .font(.caption)
                            }
                        }
                    }
                    .font(.subheadline)
                    .padding()
                }
            }
            .sheet(isPresented: $isPresenting){
                ImagePickerView(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                    .onDisappear{
                        if uiImage != nil {
                            imageClassifier.detect(uiImage: uiImage!)
                        }
                    }
                
            }
            
            .padding()
            
            
            
            Button(action:{
                progressModel.currentChapter += 1.0
                print(progressModel.currentChapter)
            }){
                Text("hey")
            }
            
            
            
            NavigationLink(destination: ChapterTest()) {
                Text("Ik ben op de locatie")
                Image(systemName: "arrow.forward.circle.fill")
            }
            
            
            
        
            
        }
    }
    
}

struct aiWithCameraView_Previews: PreviewProvider {
    static var previews: some View {
        aiWithCameraView(
            imageClassifier: ImageClassifier(),
            confidenceClassifier: ConfidenceClassifier()
        )
    }
}
