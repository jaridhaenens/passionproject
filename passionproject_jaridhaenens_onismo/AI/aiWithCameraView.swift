
import SwiftUI

//var classifier = Classifier()


struct aiWithCameraView: View {
    
    var chapter: Chapter
    
    @State var isPresenting: Bool = false
    @State var lastChapter: Bool = false
    
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @ObservedObject var imageClassifier: ImageClassifier
    @ObservedObject var confidenceClassifier: ConfidenceClassifier
    
    @ObservedObject var chapterModel = ChapterModelView()
    @ObservedObject var countModel = CountChaptersModel()
    
    
    //    @State private var modelSaved = false
    
    @EnvironmentObject var progressModel: ProgressModel
    
    @State private var showArModel: Bool = false
    
    var body: some View {
        
        VStack {
            VStack{
                
                
                Rectangle()
                    .strokeBorder()
                    //                    .foregroundColor(.yellow)
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
                    
                    Group {
                        if let imageClass = imageClassifier.imageClass {
                            
                            VStack{
                                
                                HStack {
                                    Text("Object gevonden:")
                                        .font(.caption)
                                    Text(imageClass)
                                        .bold()
                                    
                                }
                                
                                
                                if progressModel.modelSaved == false {
                                    //
                                    
                                    VStack {
                                        Button(action: {
                                            
                                            //                                        progressModel.modelSaved = true
                                            showArModel = true
                                        }) {
                                            HStack {
                                                
                                                Text("Breng \(imageClass) tot leven")
                                                Image(systemName: "arrow.forward.circle.fill")
                                                
                                            }
                                            .padding(10)
                                            .background(Color("darkColor"))
                                            .foregroundColor(Color.white)
                                            .cornerRadius(3)
                                        } .sheet(isPresented: $showArModel) {
                                            ArView(chapter: chapter)
                                        }
                                        
                                        
                                        
                                        if progressModel.lastChapter {
                                            NavigationLink(destination: EndView()){
                                                HStack {
                                                    Text("Eindig de tour")
                                                    Image(systemName: "arrow.forward.circle.fill")
                                                }
                                            }
                                        } else {
                                            NavigationLink(destination: ChapterTest().navigationBarBackButtonHidden(true)) {
                                                HStack {
                                                    Text("start hoofdstuk \(countModel.chapterAmount, specifier: "%.0f")")
                                                    Image(systemName: "arrow.forward.circle.fill")
                                                }
                                            }
                                            .onAppear() {
                                                
                                            }
                                        }
                                        
                                    }
                                    .onAppear() {
                                        
                                        progressModel.capturedModels.append("\(imageClass)-object")
                                        print(progressModel.capturedModels)
                                        
                                        if (progressModel.currentChapter == countModel.chapterAmount) {
                                            progressModel.currentChapter += 1.0
                                            progressModel.lastChapter = true
                                            print("last chapter")
                                            //                                            if progressModel.lastChapter == true {
                                            //                                                print("last chapter")
                                            //                                            }
                                        } else {
                                            progressModel.currentChapter += 1.0
                                            print("next chapter: \(progressModel.currentChapter)")
                                        }
                                    }
                                    
                                } else {
                                    
                                    Button(action: {
                                        
                                        
                                    }) {
                                        HStack {
                                            Image(systemName: "checkmark.square")
                                            Text("Object opgeslagen")
                                            
                                        }
                                        .padding(10)
                                        .background(Color.gray)
                                        .foregroundColor(Color.white)
                                        .cornerRadius(3)
                                    }
                                }
                                
                                
                                
                            }
                        } else {
                            VStack {
                                Image(systemName: "camera")
                                    .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(Color("darkColor"))
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                                    .font(.title)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .onTapGesture {
                                        isPresenting = true
                                        sourceType = .camera
                                    }
                                HStack{
                                    Text("Geen object gevonden, probeer opnieuw")
                                        .font(.caption)
                                }
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
            
            
        }
        .onAppear() {
            countModel.countChapters(tourId: "Ru6BALZFVhyBI9lBh3VO")
            
        }
    }
    
    
    
}
