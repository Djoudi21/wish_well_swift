import SwiftUI

struct EventsListItem: View {
    @Binding var event: EventEntity
    // Date formatter to format the event date
    private var dateFormatter: DateFormatter {
       let formatter = DateFormatter()
       formatter.dateStyle = .medium // You can customize this as per your need (e.g., .long, .short)
       formatter.timeStyle = .none
       return formatter
    }

    var body: some View {
        VStack {
            HStack {
                Text(event.name).padding()
                Spacer()
                Text(event.type.rawValue).padding()
            }
            HStack {
                Text(dateFormatter.string(from: event.date))
                                   .padding()
                
                Text("\(daysUntil(eventDate: event.date)) days left")
                ForEach(event.contactNames, id: \.self) { name in
                    Text(name)
                }
            }
        }.padding().overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 2)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2) // Light outer shadow
        )
    }
}

#Preview {
    EventsListItem(event: .constant(EventEntity(id: UUID(), name: "test", type: .birthday, date: Date(), contactIds: [UUID()])))
}
