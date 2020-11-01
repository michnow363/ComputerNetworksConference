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
    var importantPlacesEntities: Results<PointOfInterestEntity> {
        return GlobalVariables.realm.objects(PointOfInterestEntity.self)
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
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "MapSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        importantPlacesTableView.delegate = self
        importantPlacesTableView.dataSource = self
    }
    
}
