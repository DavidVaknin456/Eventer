import SwiftUI
import GoogleSignIn
    

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemMint

    }
        var body: some View {
            TabView {
                MyEvents()
                    .badge(10)
                    .tabItem {
                        Image(systemName: "calendar")
                    }
                PostView()
                    .tabItem {
                        Image(systemName: "square.grid.2x2")
                    }
                ChatView()
                    .tabItem {
                        Image(systemName: "message.fill")
                    }
            }
            .font(.headline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
