import SwiftUI

struct InitialView: View {
    @StateObject private var viewModel = UserViewModel()
    private var dateRange: ClosedRange<Date> {
            let maxDate = Date()
            let minDate = Calendar.current.date(byAdding: .year, value: -18, to: maxDate)!
            return minDate...maxDate
        }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User information")) {
                    TextField("First name", text: $viewModel.firstName)
                    TextField("Last name", text: $viewModel.lastName)
                    DatePicker("Birth date", selection: $viewModel.birthDate, in: dateRange, displayedComponents: .date)
                }
                
                Section {
                    NavigationLink {
                           ContentView(viewModel: viewModel)
                    } label: {
                        Text("Show the screen")
                            .frame(maxWidth: .infinity)
                    }
                    .disabled(viewModel.firstName.isEmpty || viewModel.lastName.isEmpty)
                }
            }
            .navigationTitle("Membook")
        }
    }
}

#Preview {
    InitialView()
}
