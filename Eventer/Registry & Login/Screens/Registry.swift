import SwiftUI

struct Registry: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var model = ViewModel()
    
    
    @State var name = ""
    @State var age = ""
    @State var distance = ""
    @State var city = ""
    @State var id = ""
    
    var body: some View {
        VStack {
            // Show user ID GET From Firebase
            Text(viewModel.userID)
            
            // Registry process
            Divider()
            VStack(spacing: 5) {
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Age", text: $age)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Distance", text: $distance)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("City", text: $city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    model.addData(id: viewModel.userID, name: name, age: age, distance: distance, city: city)
                    
                    name = ""
                    age = ""
                    distance = ""
                    city = ""
                    id = ""
                    
                    viewModel.regState = .register
                    
                }, label: {
                    Text("Register")
                })
            }
        }
    }
}
