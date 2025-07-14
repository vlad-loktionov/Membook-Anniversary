import SwiftUI

struct UserMainContentView: View {
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                AgeDisplayView(viewModel: viewModel)
                    .padding(.top, 20)
                Spacer()
            }
            .frame(height: 280)
            
            Spacer()
                .frame(height: 220.91)
            
            VStack(spacing: 0) {
                Image(.nanit)
                    .padding(.top, 15)
                
                VStack(spacing: 0) {
                    Spacer()
                    ShareButtonView()
                }
                .frame(maxHeight: .infinity)
            }
        }
        .zIndex(3)
    }
}

#Preview {
    @Previewable @StateObject var vm = UserViewModel()
    UserMainContentView(viewModel: vm)
}
