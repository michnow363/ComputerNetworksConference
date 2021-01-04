//
//  AccommodationViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 5/4/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit
import RealmSwift

class AccommodationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var accommodationTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RestApiManager.sharedInstance.updateLocalDatabase(with: .accommodation, completion: {
            RestApiManager.sharedInstance.updateLocalDatabase(with: .conferenceAccommodation, completion: { DispatchQueue.main.async {
                    self.accomodationEntites = []
                    self.getAccommodationEntities(GlobalVariables.realm.objects(ConferenceAccommodationEntity.self))
                    self.accommodationTableView.reloadData()
                }
            })
        })
    }
    
    func getAccommodationEntities(_ conferenceAccommodationEntities: Results<ConferenceAccommodationEntity>){
        let conferenceAccommodationEntities = conferenceAccommodationEntities.filter { entity in
            return entity.conferenceId == GlobalVariables.currentConferenceID
        }
        let organizerEntities = GlobalVariables.realm.objects(AccommodationEntity.self)
        for entity in organizerEntities {
            for conferenceEntity in conferenceAccommodationEntities {
                if entity.id == conferenceEntity.accommodationId {
                    self.accomodationEntites.append(entity)
                }
            }
        }
    }
    
    private var accomodationEntites = [AccommodationEntity]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accomodationEntites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccommodationCell", for: indexPath)
          if let accommodationCell = cell as? AccommodationCell {
            accommodationCell.setCell(withEntity: accomodationEntites[indexPath.row])
          }
          return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "MapSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accommodationTableView.delegate = self
        accommodationTableView.dataSource = self
    }
    
}

