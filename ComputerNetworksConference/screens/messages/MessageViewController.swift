//
//  MessageViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 12/9/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit
import MessageKit

class MessageViewController: UIViewController {
    
    private var vc: MessagePanelViewController!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController()
    }
    
    private func addChildViewController() {
        vc = MessagePanelViewController.getViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(vc)
        containerView.addSubview(vc.view)
        let constraints = [
            vc.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            vc.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            vc.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            vc.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    override var canBecomeFirstResponder: Bool {
        return vc.canBecomeFirstResponder
    }
     
    override var inputAccessoryView: UIView? {
        return vc.messageInputBar
    }
   
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
