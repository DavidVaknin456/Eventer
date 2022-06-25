import Firebase
import GoogleSignIn
import FirebaseFirestore


class AuthenticationViewModel: ObservableObject {
    
    // SignInState
    enum SignInState {
        case signedIn
        case signedOut
        case pending
    }
    
    // registryState
    enum registryState  {
        case register
        case notRegister
        case reGpending
    }
    
    // 1
    @Published var state: SignInState = .pending
    // 2
    @Published var regState: registryState = .reGpending
    // 2
    @Published var userID: String = ""
    
    
    
    init() {
        updateUserState()
    }
    
    func updateUserState() {
        if Auth.auth().currentUser != nil {
            // User is signed in.
            self.state = .signedIn
            self.userID = Auth.auth().currentUser!.uid
            updateRegstate()
        } else {
            // No user is signed in.
            self.state = .signedOut
        }
    }
    
    func updateRegstate() {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(self.userID)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                self.regState = .register
            } else {
                print("Document does not exist")
                self.regState = .notRegister
                
            }
        }
        
    }
    
    func signIn() {
        // 1
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error)
            }
        } else {
            // 2
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            // 3
            let configuration = GIDConfiguration(clientID: clientID)
            
            // 4
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
            
            // 5
            GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
                authenticateUser(for: user, with: error)
            }
        }
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
        // 1
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        // 2
        guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
        
        // 3
        Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.state = .signedIn
                updateUserState()
            }
        }
    }
    
    func signOut() {
        // 1
        GIDSignIn.sharedInstance.signOut()
        
        do {
            // 2
            try Auth.auth().signOut()
            
            state = .signedOut
        } catch {
            print(error.localizedDescription)
        }
    }
    
}



