import UIKit

class ImageStorage {
    private let fileManager = FileManager.default
    private var documentsDirectory: URL {
        fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func saveImage(_ image: UIImage, forKey key: String) {
        if let data = image.jpegData(compressionQuality: 0.8) {
            let fileURL = documentsDirectory.appendingPathComponent(key)
            try? data.write(to: fileURL)
        }
    }
    
    func loadImage(forKey key: String) -> UIImage? {
        let fileURL = documentsDirectory.appendingPathComponent(key)
        if let data = try? Data(contentsOf: fileURL) {
            return UIImage(data: data)
        }
        return nil
    }
}
