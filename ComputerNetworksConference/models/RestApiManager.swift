//
//  RestApiManager.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 22/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

typealias ServiceResponse = (JSON, Error?) -> Void

class RestApiManager: NSObject {
    static let sharedInstance = RestApiManager()
    
    let accommodationURL = "http://13.58.108.102:3030/api/Accommodation/get/0"
    
    private func getURl(for type: DecodableType) -> String {
        var url: String
        switch type {
        case .accommodation:
            url = accommodationURL
        }
        return url
    }
    
    func updateLocalDatabase(with type: DecodableType) {
        let url = getURl(for: type)
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let data = data {
                    switch type {
                    case .accommodation:
                        do {
                            let decodableSequence: [AccommodationDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [AccommodationEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    private func getDecodableSequence<DecodableStructType: Decodable>(from data: Data) throws -> [DecodableStructType] {
        print(String(decoding: data, as: UTF8.self))
        let decodedData = try JSONDecoder().decode([DecodableStructType].self, from: data)
        return decodedData
    }
    
    private func getEntitySequence<DecodableStructType: Decodable, RealmEntityType: RealmEntity>(from decodables: [DecodableStructType]) -> [RealmEntityType] {
        var entitySequence = [RealmEntityType]()
        for result in decodables {
            entitySequence.append(RealmEntityType(from: result))
        }
        return entitySequence
    }
    
    private func saveToRealmDatabase<RealmEntityType: RealmEntity>(entities: [RealmEntityType]) {
        try! GlobalVariables.realm.write {
            GlobalVariables.realm.add(entities, update: .all)
        }
    }
}
