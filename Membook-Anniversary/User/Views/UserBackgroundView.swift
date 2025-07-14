import SwiftUI

struct BackgroundView: View {
    let animalType: AnimalType
    
    var body: some View {
        ZStack {
            Color(animalType.backgroundColor)
                .ignoresSafeArea()
            
            animalType.backgroundImage
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .allowsHitTesting(false)
                .zIndex(2)
        }
    }
}

#Preview {
    BackgroundView(animalType: .fox)
}
