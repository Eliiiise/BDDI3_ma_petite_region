//
//  InfosModel.swift
//  MaPetiteRegion
//
//  Created by  on 18/02/2021.
//

import Foundation

// MARK: - InfosElement
struct InfosElement: Codable {
    let nhits: Int?
    let parameters: Parameters?
    let records: [Record]?
}

// MARK: - Parameters
struct Parameters: Codable {
    let dataset, timezone, q: String?
    let rows, start: Int?
    let format, lang: String?
    let facet: [String]?
}

// MARK: - Record
struct Record: Codable {
    let datasetid, recordid: String?
    let fields: Fields?
    let geometry: Geometry?
    let recordTimestamp: String?

    enum CodingKeys: String, CodingKey {
        case datasetid, recordid, fields, geometry
        case recordTimestamp = "record_timestamp"
    }
}

// MARK: - Fields
struct Fields: Codable {
    let latlon: [Double]?
    let city, dateStart, uid, tags: String?
    let pricingInfo: String?
    let image: String?
    let title, updatedAt, spaceTimeInfo, fieldsDescription: String?
    let timetable: String?
    let imageThumb: String?
    let link: String?
    let freeText, address, department, placename: String?
    let region, dateEnd, lang: String?

    enum CodingKeys: String, CodingKey {
        case latlon, city
        case dateStart = "date_start"
        case uid, tags
        case pricingInfo = "pricing_info"
        case image, title
        case updatedAt = "updated_at"
        case spaceTimeInfo = "space_time_info"
        case fieldsDescription = "description"
        case timetable
        case imageThumb = "image_thumb"
        case link
        case freeText = "free_text"
        case address, department, placename, region
        case dateEnd = "date_end"
        case lang
    }
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String?
    let coordinates: [Double]?
}

