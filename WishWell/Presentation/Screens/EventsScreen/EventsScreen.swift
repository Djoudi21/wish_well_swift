import SwiftUI

struct EventsScreen: View {
    @EnvironmentObject var viewModel: EventViewModel

    var body: some View {
        NavigationStack {
            VStack {
                EventsList(filteredEvents: $viewModel.filteredEvents)
            }.navigationTitle("").toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                  Button(action: {
                      viewModel.isEventFormPresented = true
                  }) {
                      Image(systemName: "plus.circle")
                          .resizable()
                          .scaledToFit()
                          .frame(width: 40, height: 40)
                          .foregroundColor(.blue)
                  }
              }
            }
            // Sheet presentation for the modal view
            .sheet(isPresented: $viewModel.isEventFormPresented) {
                EventFormScreen() // This will be presented modally
            }
        }
        .task {
            do {
                // Assuming your viewModel has an async method to fetch contacts
                try await viewModel.fetchAllEvents()
            } catch {}
        }
    }
}

#Preview {
    EventsScreen()
}
