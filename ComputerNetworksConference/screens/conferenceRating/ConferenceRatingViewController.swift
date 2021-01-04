//
//  ConferenceRatingViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/19/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ConferenceRatingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var StarPickerView: UIPickerView!
    
    let whiteStars = ["☆", "☆☆", "☆☆☆", "☆☆☆☆", "☆☆☆☆☆"]
    let blackStars = ["★", "★★", "★★★", "★★★★", "★★★★★"]
    var stars = ["★", "☆☆", "☆☆☆", "☆☆☆☆", "☆☆☆☆☆"]
    
    private var rateCriterionEntities = [RateCriterionEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StarPickerView.dataSource = self
        StarPickerView.delegate = self
        saveButton.layer.cornerRadius = CGFloat(20.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RestApiManager.sharedInstance.updateLocalDatabase(with: .rateCriterion, completion: {
            DispatchQueue.main.async {
                self.rateCriterionEntities.append(contentsOf: GlobalVariables.realm.objects(RateCriterionEntity.self))
                self.StarPickerView.reloadComponent(0)
            }
        })
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? rateCriterionEntities.count : stars.count
    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return component == 0 ? rateCriterionEntities[row].name : stars[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
            if pickerLabel == nil {
                pickerLabel = UILabel()
                pickerLabel?.font = UIFont(name: "Helvetica Neue", size: component == 0 ? 15 : 25)
                pickerLabel?.textAlignment = component == 0 ? .right : .center
            }
            pickerLabel?.text = component == 0 ? rateCriterionEntities[row].name : stars[row]

            return pickerLabel!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            
        } else if component == 1 {
            for index in 0...4 {
                if index == row {
                    stars[index] = blackStars[index]
                } else {
                    stars[index] = whiteStars[index]
                }
            }
        }
        StarPickerView.reloadComponent(component)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        RestApiManager.sharedInstance.updateRemoteDatabase(with: ["description": "...", "value": StarPickerView.selectedRow(inComponent: 1) + 1, "conferenceID": GlobalVariables.currentConferenceID, "presentationID": "", "mobileUserID": GlobalVariables.currentUserId, "rateCriterionID": rateCriterionEntities[StarPickerView.selectedRow(inComponent: 0)].id] , url: RestApiManager.sharedInstance.postRateURL, completion: nil)
    }
}
