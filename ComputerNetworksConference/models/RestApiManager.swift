//
//  RestApiManager.swift
//  ComputerNetworksConference
//
//  Created by Michal Nowak on 22/12/2020.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import SwiftyJSON
import RealmSwift


class RestApiManager: NSObject {
    static let sharedInstance = RestApiManager()
    
    private let conferenceAccommodationURL = "http://13.58.108.102:3030/api/Conference/ConferenceAccommodation/get"
    private let conferenceEmergencyNumberURL = "http://13.58.108.102:3030/api/Conference/ConferenceEmergencyNumber/get"
    private let conferenceOrganizersURL = "http://13.58.108.102:3030/api/Conference/ConferenceOrganizer/get"
    private let conferenceSponsorURL = "http://13.58.108.102:3030/api/Conference/ConferenceSponsor/get"
    private let conferencePointOfInterestURL = "http://13.58.108.102:3030/api/Conference/ConferencePointOfInterest/get"
    
    private let accommodationURL = "http://13.58.108.102:3030/api/Accommodation/get"
    private let buildingPlanURL = "http://13.58.108.102:3030/api/BuildingPlan/get"
    private let conferenceURL = "http://13.58.108.102:3030/api/Conference/get"
    private let emergencyNumberURL = "http://13.58.108.102:3030/api/EmergencyNumber/get"
    private let messageURL = "http://13.58.108.102:3030/api/Message/get"
    private let organizerURL = "http://13.58.108.102:3030/api/Organizer/get"
    private let participantURL = "http://13.58.108.102:3030/api/Participant/get"
    private let participantPhotoURL = "http://13.58.108.102:3030/api/Participant/ParticipantPhoto/get"
    private let pointOfInterestURL = "http://13.58.108.102:3030/api/PointOfInterest/get"
    private let pointOfInterestTypeURL = "http://13.58.108.102:3030/api/PointOfInterest/PointOfInterestType/get"
    private let pointOfInterestIconURL = "http://13.58.108.102:3030/api/PointOfInterest/PointOfInterestIcon/get"
    private let presentationURL = "http://13.58.108.102:3030/api/Presentation/get"
    private let presentationTypeURL = "http://13.58.108.102:3030/api/Presentation/PresentationType/get"
    private let presentationParticipantURL = ""
    private let presentationPhotoURL = ""
    private let rateURL = "http://13.58.108.102:3030/api/Rate/get/" + String(GlobalVariables.currentConferenceID) + "/conference"
    private let rateCriterionURL = "http://13.58.108.102:3030/api/Rate/RateCriterion/get"
    private let rateCriterionTypeURL = "http://13.58.108.102:3030/api/Rate/RateCriterionType/get"
    private let sponsorURL = "http://13.58.108.102:3030/api/Sponsor/get"
    
    let postMessageURL = "http://13.58.108.102:3030/api/Message/add"
    let postRateURL = "http://13.58.108.102:3030/api/Rate/add"
    
    func updateRemoteDatabase(with parameters: [String: Any], url: String, completion: ( () -> ())?) {
        let url = URL(string: url)!
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                print(error)
                return
            }
            completion?()
        })
        task.resume()
    }
    
    func updateLocalDatabase(with type: DecodableType, completion: @escaping () -> ()) {
        let url = getURl(for: type)
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                } else if let data = data {
                    do {
                        switch type {
                        case .accommodation:
                            let decodableSequence: [AccommodationDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [AccommodationEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .buildingPlan:
                            let decodableSequence: [BuildingPlanDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [BuildingPlanEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .conference:
                            let decodableSequence: [ConferenceDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [ConferenceEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .emergencyNumber:
                            let decodableSequence: [EmergencyNumberDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [EmergencyNumberEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .message:
                            let decodableSequence: [MessageDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [MessageEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .organizers:
                            let decodableSequence: [OrganizerDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [OrganizerEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .conferenceOrganizers:
                            let decodableSequence: [ConferenceOrganizerDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [ConferenceOrganizerEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .participant:
                            let decodableSequence: [ParticipantDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [ParticipantEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .participantPhoto:
                            let decodableSequence: [ParticipantPhotoDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [ParticipantPhotoEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .pointOfInterest:
                            let decodableSequence: [PointOfInterestDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [PointOfInterestEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .presentation:
                            let decodableSequence: [PresentationDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [PresentationEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .rate:
                            let decodableSequence: [RateDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [RateEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .rateCriterion:
                            let decodableSequence: [RateCriterionDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [RateCriterionEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .rateCriterionType:
                            let decodableSequence: [RateCriterionTypeDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [RateCriterionTypeEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .sponsor:
                            let decodableSequence: [SponsorDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [SponsorEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .conferenceAccommodation:
                            let decodableSequence: [ConferenceAccommodationDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [ConferenceAccommodationEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .pointOfInterestType:
                            let decodableSequence: [PointOfInterestTypeDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [PointOfInterestTypeEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .pointOfInterestIcon:
                            let decodableSequence: [PointOfInterestIconDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [PointOfInterestIconEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .presentationType:
                            let decodableSequence: [PresentationTypeDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [PresentationTypeEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .presentationParticipant:
                            let decodableSequence: [PresentationParticipantRootDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [PresentationParticipantEntity] = self.getEntitySequence(decodables: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .presentationPhoto:
                            let decodableSequence: [PresentationPhotoDecodable] = try self.getDecodableSequence(from: data)
                            //let entitySequence: [PresentationPhotoEntity] = self.getEntitySequence(from: decodableSequence)
                            //self.saveToRealmDatabase(entities: entitySequence)
                        case .conferenceEmergencyNumber:
                            let decodableSequence: [ConferenceEmergencyNumberDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [ConferenceEmergencyNumberEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .conferenceSponsor:
                            let decodableSequence: [ConferenceSponsorDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [ConferenceSponsorEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        case .conferencePointOfInterest:
                            let decodableSequence: [ConferencePointOfInterestDecodable] = try self.getDecodableSequence(from: data)
                            let entitySequence: [ConferencePointOfInterestEntity] = self.getEntitySequence(from: decodableSequence)
                            self.saveToRealmDatabase(entities: entitySequence)
                        }
                    } catch {
                        print(error)
                    }
                }
                completion()
            }
            task.resume()
        }
    }
    
    private func getDecodableSequence<DecodableStructType: Decodable>(from data: Data) throws -> [DecodableStructType] {
        let decodedData = try JSONDecoder().decode([DecodableStructType].self, from: data)
        return decodedData
    }
    
    private func getEntitySequence(decodables: [PresentationParticipantRootDecodable]) -> [PresentationParticipantEntity] {
        var decodableSequence = [PresentationParticipantDecodable]()
        //make multiple decodables with single participant ID, arrays are not allowed in realm
        for decodable in decodables {
            for id in decodable.participantIDs {
                decodableSequence.append(PresentationParticipantDecodable(id: decodable.id, presentationID: decodable.presentationID, participantID: id))
            }
        }
        return getEntitySequence(from: decodableSequence)
    }
    
    private func getEntitySequence<DecodableStructType: Decodable, RealmEntityType: RealmEntity>(from decodables: [DecodableStructType]) -> [RealmEntityType] {
        var entitySequence = [RealmEntityType]()
        for result in decodables {
            entitySequence.append(RealmEntityType(from: result))
        }
        return entitySequence
    }
    
    private func saveToRealmDatabase<RealmEntityType: RealmEntity>(entities: [RealmEntityType]) {
        DispatchQueue.main.async {
            try! GlobalVariables.realm.write {
                GlobalVariables.realm.add(entities, update: .all)
            }
        }
    }
    
    private func getURl(for type: DecodableType) -> String {
        var url: String
        switch type {
        case .accommodation:
            url = accommodationURL
        case .buildingPlan:
            url = buildingPlanURL
        case .conference:
            url = conferenceURL
        case .emergencyNumber:
            url = emergencyNumberURL
        case .message:
            url = messageURL
        case .organizers:
            url = organizerURL
        case .conferenceOrganizers:
            url = conferenceOrganizersURL
        case .participant:
            url = participantURL
        case .pointOfInterest:
            url = pointOfInterestURL
        case .conferencePointOfInterest:
            url = conferencePointOfInterestURL
        case .presentation:
            url = presentationURL
        case .presentationType:
            url = presentationTypeURL
        case .presentationParticipant:
            url = presentationParticipantURL
        case .presentationPhoto:
            url = presentationPhotoURL
        case .rate:
            url = rateURL
        case .rateCriterion:
            url = rateCriterionURL
        case .rateCriterionType:
            url = rateCriterionTypeURL
        case .sponsor:
            url = sponsorURL
        case .conferenceSponsor:
            url = conferenceSponsorURL
        case .conferenceAccommodation:
            url = conferenceAccommodationURL
        case .participantPhoto:
            url = participantPhotoURL
        case .pointOfInterestType:
            url = pointOfInterestTypeURL
        case .pointOfInterestIcon:
            url = pointOfInterestIconURL
        case .conferenceEmergencyNumber:
            url = conferenceEmergencyNumberURL
        }
        return url
    }
}
