//
//  NetworkManager.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import Foundation
import Alamofire

class APICtx {
    struct OpenDataSoft {
        static func urlForCityInfos(cityName:String) -> String {
            return "https://public.opendatasoft.com/api/records/1.0/search/?dataset=evenements-publics-cibul&q=\(cityName)&lang=fr&facet=tags&facet=placename&facet=department&facet=region&facet=city&facet=date_start&facet=date_end&facet=pricing_info&facet=updated_at&facet=city_district"
        }
    }
    
    struct OpenWheather {
        static func urlForCityWheather(cityName:String) -> String {
            return "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=e6493bb11a7229a71f553cc819a57aff"
        }
    }
}

class NetworkManager {

    static let instance = NetworkManager() // POUR fAIRE UN SINGLETON
    
    func getInfos(city:String, callback:@escaping (InfosElement)->()) {
        
        AF.request(APICtx.OpenDataSoft.urlForCityInfos(cityName:city)).response { response in
            if let data = response.data,
               let str = String(bytes: data, encoding: .utf8) {
                
                let data = Data(str.utf8)
                let decoder = JSONDecoder()

                do {
                    let decoded = try decoder.decode(InfosElement.self, from: data)
                    callback(decoded)
                    
                } catch {
                    print("Failed to decode JSON")
                }
                
                // callback(str)
            }
        }
    }
    
    func getWheather(city:String, callback:@escaping (WheatherElement)->()) {
        
        AF.request(APICtx.OpenWheather.urlForCityWheather(cityName:city)).response { response in
            if let data = response.data,
               let str = String(bytes: data, encoding: .utf8) {
                let data = Data(str.utf8)
                let decoder = JSONDecoder()
                do {
                    let decoded = try decoder.decode(WheatherElement.self, from: data)
                    callback(decoded)
                    
                } catch {
                    print("Failed to decode JSON")
                }
                
                // callback(str)
            }
        }
    }
}
