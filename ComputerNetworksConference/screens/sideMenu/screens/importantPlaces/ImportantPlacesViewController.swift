//
//  ImportantPlacesViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 5/4/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift
import UIKit

class ImportantPlacesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var importantPlacesTableView: UITableView!
    
    var importantPlacesEntities = [PointOfInterestEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        importantPlacesTableView.delegate = self
        importantPlacesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RestApiManager.sharedInstance.updateLocalDatabase(with: .pointOfInterest, completion: {
            RestApiManager.sharedInstance.updateLocalDatabase(with: .conferencePointOfInterest, completion: { DispatchQueue.main.async {
                    self.importantPlacesEntities = []
                    self.getAccommodationEntities(GlobalVariables.realm.objects(ConferencePointOfInterestEntity.self))
                    self.importantPlacesTableView.reloadData()
                }
            })
        })
    }
    
    func getAccommodationEntities(_ conferencePointOfInterestEntities: Results<ConferencePointOfInterestEntity>){
        let conferencePointOfInterestEntities = conferencePointOfInterestEntities.filter { entity in
            return entity.conferenceId == GlobalVariables.currentConferenceID
        }
        let organizerEntities = GlobalVariables.realm.objects(PointOfInterestEntity.self)
        for entity in organizerEntities {
            for conferenceEntity in conferencePointOfInterestEntities {
                if entity.id == conferenceEntity.pointOfInterestId {
                    self.importantPlacesEntities.append(entity)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return importantPlacesEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ImportantPlacesCell", for: indexPath)
               if let importantPlacesCell = cell as? ImportantPlacesCell {
                importantPlacesCell.setCell(withEntity: importantPlacesEntities[indexPath.row])
               }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let address = importantPlacesEntities[indexPath.row].address {
            tableView.deselectRow(at: indexPath, animated: true)
            performSegue(withIdentifier: "MapSegue", sender: address)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? MapViewController{
            if let address = sender as? String {
                controller.address = address
            }
        }
    }
}
