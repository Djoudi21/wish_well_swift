import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var viewModel: LoginViewModel // Access the ViewModel from the environment
    @State private var isRegisterViewPresented = false // State to trigger the modal

    var body: some View {
        NavigationStack() {
            VStack {
                Text("Sign in to Wish Well")
                    .font(.largeTitle)
                    .padding()
                Text("Welcome back !")
                Text("PLEASE SIGN UP TO CONTINUE")
                
                
                SocialLoginList(viewModel: viewModel)
                
                HStack(alignment: .center) {
                    HStack {}.frame(width: 70, height: 1).background(Color.black.opacity(0.3))
                    Text("or").background()
                    HStack {}.frame(width: 70, height: 1).background(Color.black.opacity(0.3))
                }
                
                LoginForm() // Pass the ObservedObject here
                Button(action: {
                    isRegisterViewPresented  = true
                }) {
                    Text("Don't have an account? Register")
                        .padding()
                        .foregroundColor(.black)
                }
                .padding()
            }
            
            // Sheet presentation for the modal view
            .sheet(isPresented: $isRegisterViewPresented) {
                RegisterScreen() // This will be presented modally
            }
            .padding()
        }
    }
}


#Preview {
    let viewModel = LoginViewModel() // Create an instance of LoginViewModel

    LoginScreen().environmentObject(viewModel) // Provide the environment object

}
