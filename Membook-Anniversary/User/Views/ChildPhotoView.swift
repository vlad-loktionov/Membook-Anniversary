import SwiftUI

struct ChildPhotoView: View {
    @ObservedObject var viewModel: UserViewModel
    let animalType: AnimalType
    
    private let photoSize: CGFloat = 220.91
    
    var body: some View {
        Group {
            if let userImage = viewModel.userImage {
                Image(uiImage: userImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: photoSize, height: photoSize)
                    .clipShape(Circle())
            } else {
                animalType.childPhoto
                    .resizable()
                    .frame(width: photoSize, height: photoSize)
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var vm = UserViewModel()
    ChildPhotoView(viewModel: vm, animalType: .elephant)
}
