import SwiftUI
import Firebase
import GoogleSignIn

@main
struct EventerApp: App {
    @StateObject var viewModel = AuthenticationViewModel()

    
    init() {
        setupAuthentication()
      }

      var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
      }
}
