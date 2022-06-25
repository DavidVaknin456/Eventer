import SwiftUI

struct LoginView: View {
    
    // 1
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            
            Text("Chat app")
                .fontWeight(.black)
                .foregroundColor(Color(.systemIndigo))
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Spacer()
            Divider()
            
            // 3
            GoogleSignInButton()
                .padding()
                .onTapGesture {
                    viewModel.signIn()
                }
        }
    }
}
