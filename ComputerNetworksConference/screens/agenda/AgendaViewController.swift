//
//  AgendaViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 4/8/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class AgendaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var agendaTable: UITableView!

    
    @IBOutlet weak var sideMenuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var modalBackground: UIView!
    
    @IBOutlet weak var eventDetailsModal: UIView!
    @IBOutlet weak var speaker: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var confDescription: UILabel!
    
    //TODO
    private var presentationEntities = [PresentationEntity]()
    private var participantsEntities = [ParticipantEntity]()
    private var presentationParticipantsEntities = [PresentationParticipantEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agendaTable.delegate = self
        agendaTable.dataSource = self

        eventDetailsModal.layer.cornerRadius = 10
        eventDetailsModal.layer.masksToBounds = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideSideMenu))
             gestureRecognizer.addTarget(self, action: #selector(self.hideEventDetailsModal))
             modalBackground.addGestureRecognizer(gestureRecognizer)
             modalBackground.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideSideMenu()
        hideEventDetailsModal()
        RestApiManager.sharedInstance.updateLocalDatabase(with: .presentation, completion: {
                DispatchQueue.main.async {
                    self.presentationEntities = []
                    self.participantsEntities = []
                    self.presentationParticipantsEntities = []
                    self.getPresentationEntities(GlobalVariables.realm.objects(PresentationEntity.self))
                    self.agendaTable.reloadData()
                }
            RestApiManager.sharedInstance.updateLocalDatabase(with: .participant, completion: {
                DispatchQueue.main.async {
                    self.participantsEntities.append(contentsOf: GlobalVariables.realm.objects(ParticipantEntity.self))
                }
                RestApiManager.sharedInstance.updateLocalDatabase(with: .presentationParticipant, completion: {
                    DispatchQueue.main.async {
                        self.presentationParticipantsEntities.append(contentsOf: GlobalVariables.realm.objects(PresentationParticipantEntity.self))
                    }
                })
            })
        })
    }
    
    func getPresentationEntities(_ entities: Results<PresentationEntity>){
        for entity in entities {
            if entity.conferenceId == GlobalVariables.currentConferenceID {
                presentationEntities.append(entity)
            }
        }
    }
    
    func showSideMenu(){
        sideMenuLeadingConstraint.constant = 0
        sideMenuTrailingConstraint.constant = 90
        modalBackground.alpha = 1.0
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
        })    }
    
    @objc func hideSideMenu(){
        let screenWidth = self.view.bounds.width
        sideMenuLeadingConstraint.constant = -screenWidth
        sideMenuTrailingConstraint.constant = 90 + screenWidth
        modalBackground.alpha = 0.0
    }
    
    func showEventDetailsModal(withEntity entity: PresentationEntity){
        place.text = entity.place
        confDescription.text = entity.presentationDescription
        modalBackground.alpha = 1.0
        UIView.animate(withDuration: 0.5, animations: {
            self.eventDetailsModal.alpha = 1.0
        })
        
        var participants = [ParticipantEntity]()
        for presentationEntity in presentationParticipantsEntities {
            if presentationEntity.presentationId == entity.id {
                if let participant = participantsEntities.first(where: { entity in
                    return entity.id == presentationEntity.participantId && presentationEntity.isSpeaker
                }) {
                    participants.append(participant)
                }
            }
        }
        //TODO test as soon as error in database will be fixed
        if !participants.isEmpty {
            speaker.text = (participants[0].firstName ?? "") + " " + (participants[0].lastName ?? "")
            for i in 1 ..< participants.count {
                speaker.text! += ", " + (participants[i].firstName ?? "") + " " + (participants[i].lastName ?? "")
            }
        }
    }
    
    @objc func hideEventDetailsModal(){
        eventDetailsModal.alpha = 0.0
        modalBackground.alpha = 0.0
    }
    
    @IBAction func sideMenuButtonPressed(_ sender: UIButton) {
        showSideMenu()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presentationEntities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AgendaCell", for: indexPath)
        if let agendaCell = cell as? AgendaCell {
            agendaCell.setCell(withEntity: presentationEntities[indexPath.row])
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "AgendaHeaderCell")
//        if let agendaHeaderCell = cell as? AgendaHeaderCell {
//            agendaHeaderCell.eventData.text = "05/11/2020"
//        }
//
//        return cell
//    }
   
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return (tableView.dequeueReusableCell(withIdentifier: "AgendaHeaderCell")?.bounds.height)!
//    }
    
    
    @IBAction func sideMenuButttonPressed(_ sender: Any) {
        showSideMenu()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showEventDetailsModal(withEntity: presentationEntities[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func generalizedAgendaPressed(_ sender: Any) {
       
    }
    
   
    
}
