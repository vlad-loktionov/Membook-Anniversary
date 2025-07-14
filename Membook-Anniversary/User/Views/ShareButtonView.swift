import SwiftUI

struct ShareButtonView: View {
    var body: some View {
        Button(action: handleShareButtonTap) {
            HStack {
                Text("Share the news")
                    .foregroundStyle(.white)
                Image(.share)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(Color.customOrange)
            .clipShape(Capsule())
        }
        .padding(.bottom, 53)
    }
    
    private func handleShareButtonTap() {
        print("Share button tapped!")
    }
}

#Preview {
    ShareButtonView()
}
