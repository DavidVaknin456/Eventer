import Foundation
import FirebaseFirestore


class ViewModel {
    
    func addData(id: String, name: String, age: String, distance: String, city: String) {
        // Add Data to Firestore
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(["name" : name, "age" : age, "distance": distance, "city": city])
    }
}
