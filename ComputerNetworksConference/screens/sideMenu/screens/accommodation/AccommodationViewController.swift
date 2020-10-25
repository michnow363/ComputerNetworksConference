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
    
    private var accomodationEntites: Results<AccommodationsEntity> {
        return GlobalVariables.realm.objects(AccommodationsEntity.self)
    }
    
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

