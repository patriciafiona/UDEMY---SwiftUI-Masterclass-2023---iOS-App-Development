//
//  CodableBundleExtension.swift
//  Touchdown
//
//  Created by Administrator on 05/04/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // MARK: - 01. Locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in Bundle")
        }
        
        // MARK: - 02. Create property for the data
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from Bundle")
        }
        
        // MARK: - 03. Create a decoder
        let decoder = JSONDecoder()
        
        // MARK: - 04. Create a property for fo decode data
        guard let decodedData = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) from Bundle")
        }
        
        // MARK: - 05. Return the ready-to-use data
        return decodedData
    }
}
