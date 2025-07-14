import SwiftUI
import PhotosUI

class UserViewModel: ObservableObject {
    @AppStorage("userFirstName") var firstName: String = ""
    @AppStorage("userLastName") var lastName: String = ""
    @AppStorage("userBirthDate") private var birthDateStorage: String = ""
    
    @Published var birthDate: Date = Date() {
        didSet {
            birthDateStorage = Self.dateFormatter.string(from: birthDate)
        }
    }
    
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                loadTransferable(from: imageSelection)
            }
        }
    }
    
    @Published var userImage: UIImage?
    private let imageStorage = ImageStorage()
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    init() {
        if let date = Self.dateFormatter.date(from: birthDateStorage) {
            birthDate = date
        }
    }
    
    var ageInMonths: Int {
        Calendar.current.dateComponents([.month], from: birthDate, to: Date()).month ?? 0
    }
    
    var formattedAge: String {
        ageInMonths < 12 ? "\(ageInMonths)" : "\(ageInMonths / 12)"
    }
    
    var ageUnit: String {
        if ageInMonths < 12 {
            return ageInMonths == 1 ? "MONTH OLD!" : "MONTHS OLD!"
        } else {
            return (ageInMonths / 12) == 1 ? "YEAR OLD!" : "YEARS OLD!"
        }
    }
    
    private func loadTransferable(from imageSelection: PhotosPickerItem) {
        imageSelection.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let data, let image = UIImage(data: data) {
                        self.userImage = image
                        self.imageStorage.saveImage(image, forKey: "userProfileImage")
                    }
                case .failure(let error):
                    print("Image loading error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func loadImage() {
        userImage = imageStorage.loadImage(forKey: "userProfileImage")
    }
}
