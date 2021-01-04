//
//  OrganizersViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import RealmSwift
import UIKit

class OrganizersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var organizersTableView: UITableView!
    
    private var organizerEntities = [OrganizerEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        organizersTableView.delegate = self
        organizersTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RestApiManager.sharedInstance.updateLocalDatabase(with: .organizers, completion: {
            RestApiManager.sharedInstance.updateLocalDatabase(with: .conferenceOrganizers, completion: { DispatchQueue.main.async {
                    self.getOrganizerEntities(GlobalVariables.realm.objects(ConferenceOrganizerEntity.self))
                    self.organizersTableView.reloadData()
                }
            })
        })
    }
    
    func getOrganizerEntities(_ conferenceOrganizerEntities: Results<ConferenceOrganizerEntity>){
        let conferenceOrganizerEntities = conferenceOrganizerEntities.filter { entity in
            return entity.conferenceId == GlobalVariables.currentConferenceID
        }
        let organizerEntities = GlobalVariables.realm.objects(OrganizerEntity.self)
        for entity in organizerEntities {
            for conferenceEntity in conferenceOrganizerEntities {
                if entity.id == conferenceEntity.organizerId {
                    self.organizerEntities.append(entity)
                }
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
         self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizerEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrganizerCell", for: indexPath)
        if let emergencyCell = cell as? OrganizerCell {
            emergencyCell.setCell(with: organizerEntities[indexPath.row])
        }
        return cell
    }
}
