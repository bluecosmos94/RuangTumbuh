//
//  WeatherService.swift
//  MasterRuangTanam
//
//  Created by Kelny Tan on 15/11/21.
//

/**
    Class ini yang mengatur access data API yang akan digunakan oleh App
*/
import Foundation

class WeatherService{
    // meng-instatiate object WeatherService
    static let weather = WeatherService()
    
    // API Key untuk menggunakan API dari OpenWeather
    let urlAPIKey = "4476f48de159d31a885a1e80d7ad8a08"
    var urlLatitude = "60.21" // dummy
    var urlLongitude = "50.00" // dummy
    var urlGetOneCall = "" // ini untuk mendapatkan hasil One Call/kode JSON
    let urlBase = "https://api.openweathermap.org/data/2.5/"
    
    let session = URLSession(configuration: .default)
    
    func accessURL() -> String{
        // query string units diassign metric untuk mendapatkan sistem metric (untuk jarak) dan celcius (untuk suhu)
        //test
        urlGetOneCall = "/onecall?lat=\(urlLatitude)&lon=\(urlLongitude)&units=metric&appid=\(urlAPIKey)"
        return urlBase + urlGetOneCall
    }
    
    func setLatitude(_ latitude: String){
        // Jika value dari latitude adalah String
        urlLatitude = latitude
    }
    
    func setLatitude(_ latitude: Double){
        // Jika value yang didapat dari API adalah Double
        setLatitude(String(latitude))
    }
    
    func setLongitude(_ longitude: String){
        urlLongitude = longitude
    }
    
    func setLongitude(_ longitude: Double){
        setLongitude(String(longitude))
    }
    
    func getWeather(onSuccess: @escaping(Result) -> Void, onError: @escaping(String) -> Void){
        guard let url = URL(string: accessURL()) else{
            onError("Error accessing the URL")
            return
        }
        
        let task = session.dataTask(with: url){(data, response, error) in
            
            DispatchQueue.main.async{
                if let error = error{
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else{
                    onError("Invalid data or response")
                    return
                }
                
                do{
                    if response.statusCode == 200{
                        let items = try JSONDecoder().decode(Result.self, from: data)
                        onSuccess(items)
                    }else{
                        onError("Response wasn't 200. It was: " + "\n\(response.statusCode)")
                    }
                } catch{
                    onError(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
