//
//  APIResults.swift
//  Toilets App
//
//  Created by Manon Le Bihan on 16/11/2023.
//

import Foundation


struct APIResults: Decodable {
    let nhits: Int?
    let parameters: Parameters?
    let records: [Record]
}

struct Parameters: Decodable {
    let dataset: String?
    let rows: Int?
    let start: Int?
    let format: String?
    let timezone: String?
}

struct Record: Decodable {
    let datasetid: String?
    let recordid: String?
    let fields: Fields
    let geometry: Geometry?
    let recordTimestamp: String?

    enum CodingKeys: String, CodingKey {
        case datasetid, recordid, fields, geometry
        case recordTimestamp = "record_timestamp"
    }
}

struct Fields: Decodable {
    let complementAdresse: String?
    let geoShape: GeoShape?
    let horaire: String?
    let accesPmr: String?
    let arrondissement: Int
    let geoPoint2d: [Double]?
    let source: String?
    let gestionnaire: String?
    let adresse: String?
    let type: String?
    let geometry: Geometry?

    enum CodingKeys: String, CodingKey {
        case complementAdresse = "complement_adresse"
        case geoShape = "geo_shape"
        case accesPmr = "acces_pmr"
        case geoPoint2d = "geo_point_2d"
        case horaire, arrondissement, source, gestionnaire, adresse, type, geometry
    }
}

struct GeoShape: Decodable {
    let coordinates: [[Double]]?
    let type: String?
}


struct Geometry: Decodable {
    let type: String?
    let coordinates: [Double]?
}
