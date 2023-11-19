//
//  DataStorage.swift
//  Toilets App
//
//  Created by Manon Le Bihan on 19/11/2023.
//

import Foundation

class DataStorage {
    static let shared = DataStorage()
    var toilets: [Record] = []
}
