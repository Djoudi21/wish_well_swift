import SwiftUI

struct HomeScreenRecentGiftsSection: View {
    @Binding var viewModel: [RecentGift]

    @State private var iconName: String = "gift.fill"
    var body: some View {
        HStack {
                Text("Recent gifts")
                    .font(.headline)
        }.padding(.horizontal)
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 16) {
              ForEach(viewModel, id: \.id) { recentGift in
                  GiftOverviewView(iconName: $iconName, gift: recentGift)
              }
          }
          .padding(.horizontal)
        }
    }
}

#Preview {
    HomeScreenRecentGiftsSection(viewModel: .constant([
        RecentGift(id:"1", name: "Gift 1",picture: "", price: 20.0, dateReceived: Date()),
        RecentGift(id:"2", name: "Gift 1", picture: "", price: 20.0, dateReceived: Date())
    ]))
}
