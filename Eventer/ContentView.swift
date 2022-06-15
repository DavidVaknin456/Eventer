import SwiftUI
import Firebase


struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    
    var body: some View {
        // If pending
        if viewModel.state == .pending  {
            PendingScreen()
        }
        
        // if not logged in // todo if pending
        if viewModel.state == .signedOut {
            LoginView()
        }
        
        // If pending
        if viewModel.regState == .reGpending && viewModel.state == .signedIn {
            PendingScreen()
        }
        
        // if not register
        else if viewModel.regState == .notRegister {
            Registry()
        }
        
        // if the user is register
        else if viewModel.regState == .register &&  viewModel.state == .signedIn {
            HomeView()
        }
    }
}
