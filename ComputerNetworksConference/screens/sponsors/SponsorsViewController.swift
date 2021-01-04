//
//  SponsorsViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit
import RealmSwift

class SponsorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var sponsorsTable: UITableView!
    private var sponsorEntities = [SponsorEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sponsorsTable.delegate = self
        sponsorsTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RestApiManager.sharedInstance.updateLocalDatabase(with: .conferenceSponsor, completion: {
            RestApiManager.sharedInstance.updateLocalDatabase(with: .sponsor, completion: { DispatchQueue.main.async {
                    self.getSponsorEntities(GlobalVariables.realm.objects(ConferenceSponsorEntity.self))
                    self.sponsorsTable.reloadData()
                }
            })
        })
    }
    
    private func getSponsorEntities(_ conferenceSponsorEntities: Results<ConferenceSponsorEntity>){
        let conferenceSponsorEntities = conferenceSponsorEntities.filter { entity in
            return entity.conferenceId == GlobalVariables.currentConferenceID
        }
        let organizerEntities = GlobalVariables.realm.objects(SponsorEntity.self)
        for entity in organizerEntities {
            for conferenceEntity in conferenceSponsorEntities {
                if entity.id == conferenceEntity.sponsorId {
                    self.sponsorEntities.append(entity)
                }
            }
        }
    }
     
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return sponsorEntities.count
     }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "SponsorsCell", for: indexPath)
         if let sponsorsCell = cell as? SponsorsCell {
            sponsorsCell.setCell(withEntity: sponsorEntities[indexPath.row])
         }
         return cell
     }
}
