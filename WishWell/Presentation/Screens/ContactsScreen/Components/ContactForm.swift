import SwiftUI

struct ContactForm: View {
    @Binding var name: String
    @Binding var relationship: RelationshipType
    @Binding var birthday: Date
    @Binding var selectedRelationshipOption: String

   let relationshipOptions: [String: RelationshipType] = [
       "Famille": .family,
       "Amis": .friend,
       "Collegues": .colleague
   ]

    var body: some View {
        TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
        
        Picker("Select an relationship", selection: $selectedRelationshipOption) {
            ForEach(Array(relationshipOptions.keys), id: \.self) { label in
                Text(label).tag(relationshipOptions[label])
            }
        }
        .pickerStyle(MenuPickerStyle())
        .onChange(of: selectedRelationshipOption) { oldValue, newValue in
            if let selectedRelationship = relationshipOptions[newValue] {
               relationship = selectedRelationship
           }
        }
  
        DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                       .datePickerStyle(DefaultDatePickerStyle()) // Style for the DatePicker
                       .padding()
    }
}

#Preview {
    ContactForm(name: .constant("username"), relationship: .constant(.colleague), birthday: .constant(Date()), selectedRelationshipOption: .constant("Famille"))
}
