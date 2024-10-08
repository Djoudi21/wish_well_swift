import Foundation

class HttpEventRepository: EventRepositoryProtocol {
    func fetchAllEvents() async throws -> [FetchEventDto] {
        // Fetch the base URL from environment variables
        guard let baseURL = ProcessInfo.processInfo.environment["WISH_WELL_API_BASE_URL"],
              let url = URL(string: "\(baseURL)/users/e116cd8a-25aa-4e8b-b168-037354b454a2/events") else {
            throw APIError.invalidURL // Handle invalid URL error
        }
        
        do {
            // Make the network request asynchronously
            let (data, response) = try await URLSession.shared.data(from: url)
  
            // Check if the response is valid and has a status code of 200
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponse // Handle invalid response error
            }

            // Create a custom date formatter for decoding
            let isoDateFormatter = DateFormatter()
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(isoDateFormatter) // Use the custom formatter
            isoDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            return try decoder.decode([FetchEventDto].self, from: data)
        } catch _ as DecodingError {
            return []
        } catch {
            throw error
        }
    }
    
    func addEvent(_ event: AddEventDto) async throws {
        // Fetch the base URL from environment variables
        guard let baseURL = ProcessInfo.processInfo.environment["WISH_WELL_API_BASE_URL"],
              let url = URL(string: "\(baseURL)/users/eccc4e0f-a701-490b-8046-118cfea9491f/events") else {
            throw APIError.invalidURL // Handle invalid URL error
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST" // Set the HTTP method to POST
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // Set the Content-Type header
        
  
        let encoder = JSONEncoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
           
        let jsonData = try encoder.encode(event)
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
}
