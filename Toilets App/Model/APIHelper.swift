//
//  APIHelper.swift
//  Toilets App
//
//  Created by Manon Le Bihan on 16/11/2023.
//

import Foundation

class APIHelper {
    
    static let shared = APIHelper()
    
    let apiEntryPoint = "https://data.ratp.fr/api/records/1.0/search/?dataset=sanisettesparis2011&start=0&rows=1000"
    
    func getUrl() -> URL? {
        let urlString = apiEntryPoint
        return URL(string: urlString)
    }
    
    func performRequest(completion: @escaping (([Record]) -> Void)) {
        if let url = getUrl() {
            print(url)
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let d = data {
                    let decoder = JSONDecoder()
                    do {
                        let results = try decoder.decode(APIResults.self, from: d)
                        completion(results.records)
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    completion([])
                }
            }.resume()
        } else {
            completion([])
        }
    }
}
