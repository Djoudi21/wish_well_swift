import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

class HttpContactRepository: ContactRepositoryProtocol {
    func fetchAllContacts() async throws -> [FetchContactDto] {
        // Fetch the base URL from environment variables
        guard let baseURL = ProcessInfo.processInfo.environment["WISH_WELL_API_BASE_URL"],
              let url = URL(string: "\(baseURL)/users/1/contacts") else {
            throw APIError.invalidURL // Handle invalid URL error
        }
        
        do {
            // Make the network request asynchronously
            let (data, response) = try await URLSession.shared.data(from: url)
            
            //if let jsonString = String(data: data, encoding: .utf8) {
             //print("Raw JSON Response: \(jsonString)")
            //}

            // Check if the response is valid and has a status code of 200
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponse // Handle invalid response error
            }

            // Create a custom date formatter for decoding
            let isoDateFormatter = DateFormatter()
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(isoDateFormatter) // Use the custom formatter
            isoDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
           
            return try decoder.decode([FetchContactDto].self, from: data)
        } catch _ as DecodingError {
            return []
        } catch {
            throw error
        }
    }


    func fetchContact(by id: UUID) -> ContactEntity? {
        return nil
    }
    
    func addContact(_ contact: AddContactDto) async throws -> Void {
        // Fetch the base URL from environment variables
        guard let baseURL = ProcessInfo.processInfo.environment["WISH_WELL_API_BASE_URL"],
              let url = URL(string: "\(baseURL)/users/e116cd8a-25aa-4e8b-b168-037354b454a2/contacts") else {
            throw APIError.invalidURL // Handle invalid URL error
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // Set the HTTP method to POST
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // Set the Content-Type header
        
  
        let encoder = JSONEncoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
           
        let jsonData = try encoder.encode(contact)
        request.httpBody = jsonData

        do {
            // Make the network request asynchronously
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Check if the response is valid and has a status code of 200
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                _ = String(data: data, encoding: .utf8)
                throw APIError.invalidResponse // Handle invalid response error
            }
            return
        } catch {
            throw error
        }
    }
    
    func updateContact(_ contact: ContactEntity) {
    }
    
    func deleteContact(by id: UUID) {
    }
}
