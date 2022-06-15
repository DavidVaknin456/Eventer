import SwiftUI
import MapKit
import CoreLocationUI


struct LocationView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack (alignment: .bottom){
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .tint(.pink)
            
            LocationButton(.currentLocation) {
                viewModel.requestAllowOnceLocationPermission()
            }
            .cornerRadius(10)
            .foregroundColor(.white)
            .padding(.bottom, 10)
            .padding(.trailing, 20)
            .labelStyle(.iconOnly)
            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
            
        }
    }
    
    struct LocationView_Previews: PreviewProvider {
        static var previews: some View {
            LocationView()
        }
    }
}


final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40,
                                       longitude: 120), span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestAllowOnceLocationPermission() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            // Show eror
            return
        }
        
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
