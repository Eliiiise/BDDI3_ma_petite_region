//
//  NewsModelUI.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit

struct NewsModelUI {
    
    var title:String = ""
    var hat:String = ""
    var imageUrl:String = ""
    var fullContent:String = ""
    var date:String = ""
    
    static func defaultModel() -> NewsModelUI {
        NewsModelUI(title: "mon super tite", hat: "Mon super contenu Mon super contenu Mon super contenu Mon super contenu Mon super contenu Mon super contenu", imageUrl: "annecy_bg", fullContent: "Mon super contenu Mon super contenu Mon super contenu Mon super contenu Mon super contenu Mon super contenu", date: "10/02/2020")
    }
}
