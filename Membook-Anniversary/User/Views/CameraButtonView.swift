import SwiftUI
import PhotosUI

struct CameraButtonView: View {
    @ObservedObject var viewModel: UserViewModel
    let animalType: AnimalType
    
    private let photoSize: CGFloat = 220.91
    private let buttonSize: CGFloat = 36
    
    var body: some View {
        PhotosPicker(
            selection: $viewModel.imageSelection,
            matching: .images,
            photoLibrary: .shared()
        ) {
            animalType.cameraPhoto
                .foregroundColor(.white)
                .font(.system(size: 16))
                .frame(width: buttonSize, height: buttonSize)
                .background(Circle().fill(Color.customOrange))
        }
        .offset(
            x: (photoSize / 2) * cos(.pi / 4),
            y: -(photoSize / 2) * sin(.pi / 4)
        )
        .zIndex(4)
    }
}

#Preview {
    @Previewable @StateObject var vm = UserViewModel()
    CameraButtonView(viewModel: vm, animalType: .fox)
}
