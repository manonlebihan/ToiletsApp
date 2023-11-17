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

/*{"nhits": 617, "parameters": {"dataset": "sanisettesparis2011", "rows": 1000, "start": 0, "format": "json", "timezone": "UTC"}, "records": [{"datasetid": "sanisettesparis2011", "recordid": "1cbc4c531185bf0f489922614c0be51e8d84d161", "fields": {"complement_adresse": "numero_de_voie nom_de_voie", "geo_shape": {"coordinates": [[2.3214109225079844, 48.83997793898217]], "type": "MultiPoint"}, "horaire": "24 h / 24", "acces_pmr": "Oui", "arrondissement": 75015, "geo_point_2d": [48.83997793898217, 2.3214109225079844], "source": "http://opendata.paris.fr", "gestionnaire": "Toilette publique de la Ville de Paris", "adresse": "4  RUE DU COMMANDANT RENE MOUCHOTTE", "type": "SANISETTE"}, "geometry": {"type": "Point", "coordinates": [2.3214109225079844, 48.83997793898217]}, "record_timestamp": "2023-11-04T05:12:00.448Z"}, {"datasetid": "sanisettesparis2011", "recordid": "62cf65d754c7f5a081754d932889c1c2bc76a18b", "fields": {"complement_adresse": "numero_de_voie nom_de_voie", "geo_shape": {"coordinates": [[2.2975700464692994, 48.88888267432093]], "type": "MultiPoint"}, "horaire": "6 h - 22 h", "acces_pmr": "Oui", "arrondissement": 75017, "geo_point_2d": [48.88888267432093, 2.2975700464692994], "source": "http://opendata.paris.fr", "gestionnaire": "Toilette publique de la Ville de Paris", "adresse": "face au 1 AVENUE EMILE ET ARMAND MASSARD", "type": "SANISETTE"}, "geometry": {"type": "Point", "coordinates": [2.2975700464692994, 48.88888267432093]}, "record_timestamp": "2023-11-04T05:12:00.448Z"}, {"datasetid": "sanisettesparis2011", "recordid": "487bd4c05aa9d273a0179fca0739169be4667d74", "fields": {"complement_adresse": "numero_de_voie nom_de_voie", "geo_shape": {"coordinates": [[2.3607006873977197, 48.860059866028]], "type": "MultiPoint"}, "horaire": "6 h - 22 h", "acces_pmr": "Oui", "arrondissement": 75003, "geo_point_2d": [48.860059866028, 2.3607006873977197], "source": "http://opendata.paris.fr", "gestionnaire": "Toilette publique de la Ville de Paris", "adresse": "2  RUE DES QUATRE FILS", "type": "SANISETTE"}, "geometry": {"type": "Point", "coordinates": [2.3607006873977197, 48.860059866028]}, "record_timestamp": "2023-11-04T05:12:00.448Z"}, {"datasetid": "sanisettesparis2011", "recordid": "f228f073add6dc4e0c98c78a30c0b811e9754ebb", "fields": {"complement_adresse": "numero_de_voie nom_de_voie", "geo_shape": {"coordinates": [[2.3670324237623683, 48.86112313165573]], "type": "MultiPoint"}, "horaire": "24 h / 24", "acces_pmr": "Oui", "arrondissement": 75003, "geo_point_2d": [48.86112313165573, 2.3670324237623683], "source": "http://opendata.paris.fr", "gestionnaire": "Toilette publique de la Ville de Paris", "adresse": "1  BOULEVARD DES FILLES DU CALVAIRE", "type": "SANISETTE"}, "geometry": {"type": "Point", "coordinates": [2.3670324237623683, 48.86112313165573]}, "record_timestamp": "2023-11-04T05:12:00.448Z"}, {"datasetid": "sanisettesparis2011", "recordid": "52da7868c9dc73f220621279f53d48706c90c37a", "fields": {"complement_adresse": "numero_de_voie nom_de_voie", "geo_shape": {"coordinates": [[2.260533615073398, 48.848331615372416]], "type": "MultiPoint"}, "horaire": "6 h - 22 h", "acces_pmr": "Oui", "arrondissement": 75016, "geo_point_2d": [48.848331615372416, 2.260533615073398], "source": "http://opendata.paris.fr", "gestionnaire": "Toilette publique de la Ville de Paris", "adresse": "101  BOULEVARD DE MONTMORENCY", "type": "SANISETTE"}, "geometry": {"type": "Point", "coordinates": [2.260533615073398, 48.848331615372416]}, "record_timestamp": "2023-11-04T05:12:00.448Z"}, {"datasetid": "sanisettesparis2011", "recordid": "936560efbdfff558bc537667390cc4d0c6a3c5bd", "fields": {"complement_adresse": "numero_de_voie nom_de_voie", "geo_shape": {"coordinates": [[2.2829708555165014, 48.881117592018256]], "type": "MultiPoint"}, "horaire": "6 h - 22 h", "acces_pmr": "Oui", "arrondissement": 75017, "geo_point_2d": [48.881117592018256, 2.2829708555165014], "source": "http://opendata.paris.fr", "gestionnaire": "Toilette publique de la Ville de Paris", "adresse": "7  AVENUE DE LA PORTE DES TERNES", "type": "SANISETTE"}, "geometry": {"type": "Point", "coordinates": [2.2829708555165014, 48.881117592018256]}, "record_timestamp": "2023-11-04T05:12:00.448Z"}, {"datasetid": "sanisettesparis2011", "recordid": "f80a83000dcdb3f3c05dd85797e1d84e20db77c4", "fields": {"complement_adresse": "numero_de_voie nom_de_voie", "geo_shape": {"coordinates": [[2.3698556399042316, 48.89338413651009]], "type": "MultiPoint"}, "horaire": "6 h - 22 h", "acces_pmr": "Oui", "arrondissement": 75019, "geo_point_2d": [48.89338413651009, 2.3698556399042316], "source": "http://opendata.paris.fr", "gestionnaire": "Toilette publique de la Ville de Paris", "adresse": "154  RUE D AUBERVILLIERS", "type": "SANISETTE"}, "geometry": {"type": "Point", "coordinates": [2.3698556399042316, 48.89338413651009]}, "record_timestamp": "2023-11-04T05:12:00.448Z"}, {"datasetid": "sanisettesparis2011", "recordid": "a2359978a89362a7f6ac2ba251a6a36878603151", "fields": {"complement_adresse": "numero_de_voie nom_de_voie", "geo_shape": {"coordinates": [[2.3739240719106323, 48.88869536274599]], "type": "MultiPoint"}, "horaire": "24 h / 24", "acces_pmr": "Oui", "arrondissement": 75019, "geo_point_2d": [48.88869536274599, 2.3739240719106323], "source": "http://opendata.paris.fr", "gestionnaire": "Toilette publique de la Ville de Paris", "adresse": "69  AVENUE DE FLANDRE", "type": "SANISETTE"}, "geometry": {"type": "Point", "coordinates": [2.3739240719106323, 48.88869536274599]}, "record_timestamp": "2023-11-04T05:12:00.448Z"}, {"datasetid": "sanisettesparis2011", "recordid": "2de6311f345a8cc42623bfab13300c133b39baab", "fields": {"complement_adresse": "numero_de_voie nom_de_voie", "geo_shape": {"coordinates": [[2.3439878240330576, 48.84781204558065]], "type": "MultiPoint"}, "horaire": "6 h - 1 h", "acces_pmr": "Oui", "arrondissement": 75005, "geo_point_2d": [48.84781204558065, 2.3439878240330576], "source": "http://opendata.paris.fr", "gestionnaire": "Toilette publique de la Ville de Paris", "adresse": "RUE SAINT JACQUES", "type": "SANISETTE"}, "geometry": {"type": "Point", "coordinates": [2.3439878240330576, 48.84781204558065]}, "record_timestamp": "2023-11-04T05:12:00.448Z"}, {"datasetid": "sanisettesparis2011", "recordid": */
