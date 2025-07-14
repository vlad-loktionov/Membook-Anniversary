import SwiftUI
import PhotosUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: UserViewModel
    var animalType: AnimalType
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        self.animalType = AnimalType.random()
    }
    
    var body: some View {
        ZStack {
            Color(animalType.backgroundColor)
                .ignoresSafeArea()
            
            ChildPhotoView(viewModel: viewModel, animalType: animalType)
                .zIndex(1)
            
            animalType.backgroundImage
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .allowsHitTesting(false)
                .zIndex(2)
            
            UserMainContentView(viewModel: viewModel)
                .zIndex(3)
            
            CameraButtonView(viewModel: viewModel, animalType: animalType)
                .zIndex(4)
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(.back)
                        .foregroundColor(.white)
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .padding(.top, -44)
        .onAppear {
            viewModel.loadImage()
        }
    }
}

#Preview {
    @Previewable @StateObject var userViewModel: UserViewModel = UserViewModel()
    ContentView(viewModel: userViewModel)
}


