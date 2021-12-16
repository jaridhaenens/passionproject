import SwiftUI

class ConfidenceClassifier: ObservableObject {
    
    @Published private var classifier = Classifier()
    
    var confidenceClassifier: Float? {
        classifier.confidence
    }
        
    // MARK: Intent(s)
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage (image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
        
    }
        
}
