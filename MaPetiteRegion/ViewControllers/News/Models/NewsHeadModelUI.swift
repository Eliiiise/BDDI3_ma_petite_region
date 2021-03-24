//
//  NewsHeadModelUI.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit

struct NewsHeadModelUI {
    
    enum ImageName:String {
        case Annecy = "annecy_bg"
    }
    
    var cityName:String = ""
    var nbNews:String = ""
    var imageName:String = ""
    var backgroundColor:UIColor = .cyan
    
    static func annecyDefault(nbNews:Int = 25) -> NewsHeadModelUI {
        return NewsHeadModelUI(cityName: "Annecy", nbNews: "\(nbNews) news", imageName: "annecy_bg", backgroundColor: UIContext.Colors.Global.annecyBGColor)
    }
    
    static func grenobleDefault(nbNews:Int = 25) -> NewsHeadModelUI {
        return NewsHeadModelUI(cityName: "Grenoble", nbNews: "\(nbNews) news", imageName: "grenoble_bg", backgroundColor: UIContext.Colors.Global.grenobleBGColor)
    }
    
    static func aixDefault(nbNews:Int = 25) -> NewsHeadModelUI {
        return NewsHeadModelUI(cityName: "Aix les bains", nbNews: "\(nbNews) news", imageName: "aix_bg", backgroundColor: UIContext.Colors.Global.aixBGColor)
    }
    
    static func annemasseDefault(nbNews:Int = 25) -> NewsHeadModelUI {
        return NewsHeadModelUI(cityName: "Annemasse", nbNews: "\(nbNews) news", imageName: "annemasse_bg", backgroundColor: UIContext.Colors.Global.annemasseBGColor)
    }
    
    static func chambeDefault(nbNews:Int = 25) -> NewsHeadModelUI {
        return NewsHeadModelUI(cityName: "Chambéry", nbNews: "\(nbNews) news", imageName: "chambery_bg", backgroundColor: UIContext.Colors.Global.chambeBGColor)
    }
    
    static func lyonDefault(nbNews:Int = 25) -> NewsHeadModelUI {
        return NewsHeadModelUI(cityName: "Lyon", nbNews: "\(nbNews) news", imageName: "lyon_bg", backgroundColor: UIContext.Colors.Global.lyonBGColor)
    }
}
