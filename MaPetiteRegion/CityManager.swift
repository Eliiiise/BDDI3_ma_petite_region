//
//  CityManager.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import UIKit

class CityManager {
    static let instance = CityManager()
    
    var cities = [SettingsModelUI(cityName: "Annecy", cityBool: true),
                  SettingsModelUI(cityName: "Lyon", cityBool: true),
                  SettingsModelUI(cityName: "Aix les bains", cityBool: true),
                  SettingsModelUI(cityName: "Chambéry", cityBool: true),
                  SettingsModelUI(cityName: "Annemasse", cityBool: true),
                  SettingsModelUI(cityName: "Grenoble", cityBool: true)]
    
    static let imageBg = [
        "Annecy" : UIImage(named: "annecy_bg"),
        "Lyon" : UIImage(named: "lyon_bg"),
        "Grenoble" : UIImage(named: "grenoble_bg"),
        "Annemasse" : UIImage(named: "annemasse_bg"),
        "Aix les bains" : UIImage(named: "aix_bg"),
        "Chambéry" : UIImage(named: "chambery_bg")
    ]
    
    static let imageImg = [
        "Annecy" : UIImage(named: "annecy_img"),
        "Lyon" : UIImage(named: "lyon_img"),
        "Grenoble" : UIImage(named: "grenoble_img"),
        "Annemasse" : UIImage(named: "annemasse_img"),
        "Aix les bains" : UIImage(named: "aix_img"),
        "Chambéry" : UIImage(named: "chambery_img")
    ]
    
    var activatedCities:[SettingsModelUI] = []
    
    var currentCity = "Annecy"
    
    func filterCities() {
        activatedCities = cities.filter{ $0.cityBool == true }
    }
}
