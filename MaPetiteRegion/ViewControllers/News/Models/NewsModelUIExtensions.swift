//
//  NewsModelUIExtensions.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import Foundation

extension NewsModelUI {
    
    static func createModelsFromJsonModel(model:InfosElement) -> [NewsModelUI] {
        
        var models = [NewsModelUI]()
        
        if let records = model.records {
            
            for i in 0..<records.count {
                models.append(NewsModelUI(title: records[i].fields?.title ?? "",
                                          hat: records[i].fields?.freeText ?? "",
                                          imageUrl: records[i].fields?.image ?? "",
                                          fullContent: records[i].fields?.freeText ?? "",
                                          date: records[i].fields?.dateStart ?? ""))
            }
            
        }
        
        return models
    }
    
}
