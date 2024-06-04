import UIKit
import CoreLocation

class NetworkingManager {
    
    /// Geting latitude and longitude coordinates from city.
    /// - Parameter city: String value of city coordinate we want recive.
    func getCoordinateFor(city: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(city) { placemarks, error in
            if let error = error {
                print("Geocoder error: \(error.localizedDescription)")
                return
            }
            guard let placemark = placemarks?.first, let location = placemark.location else {
                print("No location Found")
                return
            }
            let coordinates = location.coordinate
            print("Coordinate of \(city): \(coordinates.latitude), \(coordinates.longitude)")
        }
    }
    
    
    /// Get weather data from backend using coordinates.
    /// - Parameters:
    ///   - latitude: latitude value
    ///   - longitude: longitude value
    func getDataFrom(latitude: Double, longitude: Double) {
        let key = "fddd9716-fff8-4e88-8908-941d7d294f95"
        let header = "X-Yandex-API-Key"
        let urlString = "https://api.weather.yandex.ru/v2/informers?lat=\(latitude)&lon=\(longitude)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.addValue(key, forHTTPHeaderField: header)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            guard let safeData = data else { return }
            self.decodeData(data: safeData)
        }.resume()
        
    }
    
    func decodeData(data: Data) -> WeatherModel? {
        if  let decodedData = try? JSONDecoder().decode(NetworkModel.self, from: data) {
            let temperature = decodedData.fact.temp
            let condition = decodedData.fact.condition
            let weather = WeatherModel(condition: condition, temperature: temperature)
            return weather
        }
        
        return nil
    }
    
}
