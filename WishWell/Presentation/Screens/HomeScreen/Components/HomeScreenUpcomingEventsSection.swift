import SwiftUI

struct HomeScreenUpcomingEventsSection: View {
    @Binding var upcomingEvents: [EventEntity]

    var body: some View {
        HStack {
            Text("Upcoming Events")
                .font(.headline)
       }
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 16) {
              ForEach(upcomingEvents, id: \.self.id) { event in
                  VStack {
                      ZStack(alignment: .topTrailing) {
                          Image(systemName: "person.fill").resizable()
                              .scaledToFit()
                              .clipShape(Circle())  .padding()
                              .frame(width: 100, height: 100)
                              .background(Color.red.opacity(0.2))
                              .cornerRadius(60)
                          
                          // Calculate days left
                          let daysLeft = daysUntil(eventDate: event.date)
                        
                          // Badge overlay with GeometryReader to adjust size based on content
                          GeometryReader { geometry in
                              let badgeWidth = max(20, geometry.size.width) // Ensure minimum width
                              Circle()
                                  .fill(Color.red)
                                  .frame(width: badgeWidth, height: 30) // Set the height to 20
                                  .overlay(
                                      Text("\(daysLeft)")
                                          .font(.caption)
                                          .fontWeight(.bold)
                                          .foregroundColor(.white)
                                  )
                                  .offset(x: 5, y: -5) // Adjust position of the badge
                          }
                          .frame(width: 40, height: 20) // Provide a fixed frame for the GeometryReader
                      }
                      Text(event.name)
                          .font(.subheadline)
                          .padding(.top, 2)
                  }.padding(.top, 20)
              }
          }
          .padding(.horizontal)
      }
    }
}

#Preview {
    HomeScreenUpcomingEventsSection(upcomingEvents: .constant([
        EventEntity(id: UUID(), name: "anniv brks", type: .birthday, date: Date(), contactIds: [],contacts: [ContactEntity(id: UUID(), name: "becks", relationship: .friend)]),
    ]))
}
