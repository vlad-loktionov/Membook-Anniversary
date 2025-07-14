import SwiftUI

struct AgeDisplayView: View {
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Text("TODAY \(viewModel.firstName.uppercased()) \(viewModel.lastName.uppercased()) IS")
                .font(.custom("BentonSans-Bold", size: 40))
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 20) {
                Image(.lswirls)
                    .resizable()
                    .frame(width: 50.2, height: 43.53)
                
                Text(viewModel.formattedAge)
                    .font(.custom("BentonSans-Bold", size: 60))
                    .frame(width: 47.8, height: 84.7)
                    .minimumScaleFactor(0.5)
                
                Image(.rswirls)
                    .resizable()
                    .frame(width: 50.2, height: 43.53)
            }
            .padding(.top, 13)
            
            Text(viewModel.ageUnit)
                .font(.custom("BentonSans-Bold", size: 21))
                .padding(.top, 14)
        }
    }
}


#Preview {
    @Previewable @StateObject var vm = UserViewModel()
    AgeDisplayView(viewModel: vm)
}
