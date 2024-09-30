import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = "User"
    @Published var password: String = "Password"
    @Published var isAuthenticated: Bool = true
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Any initialization logic, such as fetching stored credentials
    }

    func login() {
        guard !username.isEmpty, !password.isEmpty else {
            errorMessage = "Username and password cannot be empty."
            return
        }

        if username == "User" && password == "Password" {
            print("VALID")
            isAuthenticated = true
            errorMessage = nil
        } else {
            print("IN VALID")
            isAuthenticated = false
            errorMessage = "Invalid credentials."
        }
    }
    
    
    func loginFromSocialLogin( ) {
        print("social login")
    }
}
