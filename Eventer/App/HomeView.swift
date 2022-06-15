import SwiftUI
import GoogleSignIn

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Divider()
                HStack {
                    Button("Sign Out", action: viewModel.signOut)
                    NavigationLink(destination: LocationView()) {
                        Label("Your Loaction", systemImage: "location")
                    }

                }
                .buttonStyle(.bordered)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

}
