//
//  HomeViewController.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var wheatherObject:WheatherElement?
    var temperature:String = ""
    var wheather:String = ""
    var wheatherDescription:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        CityManager.instance.filterCities()
        
        NetworkManager.instance.getWheather(city: CityManager.instance.currentCity) {
            wheather in
            
            if let temp = wheather.main?.temp {
                self.temperature = String(temp)
            }
            
            if let w = wheather.weather?[0].main {
                self.wheather = w
            }
            
            if let desc = wheather.weather?[0].weatherDescription {
                self.wheatherDescription = desc
            }
            self.wheatherObject = wheather
            
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        CityManager.instance.filterCities()
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Head", for: indexPath) as? HeadCollectionViewCell {
                
                cell.setup(cityName: CityManager.instance.currentCity)
                
                return cell
            }
        }
        
        if indexPath.item == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Meteo", for: indexPath) as? MeteoCollectionViewCell {
                
                cell.setup(temp: temperature, wheather: wheather, descritpitonWheather: wheatherDescription)
                
                return cell
            }
        }
        
        if indexPath.item == 2 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Text", for: indexPath) as? TextCollectionViewCell {
                
                cell.setup(text: "Vous étes à ...")
                
                return cell
            }
        }
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "City", for: indexPath) as? CityCollectionViewCell {
            
            let city = CityManager.instance.activatedCities[indexPath.row-3]
            cell.setup(city: city.cityName, nbNews: "25 news")
            
            return cell
        }
        
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3 + CityManager.instance.activatedCities.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = self.view.frame.width
        let halfScreenWidth = (screenWidth)/2
        let height = halfScreenWidth * 0.8
        
        if indexPath.item == 0 {
            return CGSize(width: screenWidth, height: 300)
        }
        
        if indexPath.item == 1 {
            return CGSize(width: screenWidth, height: 135)
        }
        
        if indexPath.item == 2 {
            return CGSize(width: screenWidth, height: 60)
        }
        
        return CGSize(width: halfScreenWidth, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if indexPath.item > 2 {
            CityManager.instance.currentCity = CityManager.instance.activatedCities[indexPath.item - 3].cityName
            
            NetworkManager.instance.getWheather(city: CityManager.instance.currentCity) {
                wheather in
                
                if let temp = wheather.main?.temp {
                    self.temperature = String(temp)
                }
                
                if let w = wheather.weather?[0].main {
                    self.wheather = w
                }
                
                if let desc = wheather.weather?[0].weatherDescription {
                    self.wheatherDescription = desc
                }
                self.wheatherObject = wheather
            }
            
            collectionView.reloadData()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
