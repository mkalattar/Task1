//
//  ViewController.swift
//  Task 1
//
//  Created by Mohamed Attar on 05/10/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var charityButton: pageViewButton!
    @IBOutlet weak var offersButton: pageViewButton!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var historyButton: pageViewButton!
    
    var pageViewController: PVC!
    
    var buttons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Info View Configuration (Shadow, Corner Radius)
        configureInfoView()
        
        // Buttons Configuration (Setting selected button, page view index)
        buttons = [charityButton, offersButton, historyButton]
        configureButtons()
    }
    
    func configureInfoView() {
        // Shadow
        infoView.layer.shadowColor = UIColor.systemGray.cgColor
        infoView.layer.shadowOpacity = 0.3
        infoView.layer.shadowOffset = CGSize(width: 0, height: 3)
        infoView.layer.shadowRadius = 5
        
        // Corner Radius
        infoView.layer.cornerRadius = 10
    }
    
    func configureButtons() {
        for button in buttons {
            button.isSelected = false
        }
        historyButton.isSelected = true
    }
    
//    func selectHistoryButton() {
//        for button in buttons {
//            button.isSelected = false
//        }
//        historyButton.isSelected = true
//    }
//    func selectOffersButton() {
//        for button in buttons {
//            button.isSelected = false
//        }
//        offersButton.isSelected = true
//    }
//    func selectCharityButton() {
//        for button in buttons {
//            button.isSelected = false
//        }
//        charityButton.isSelected = true
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toPVC" {
                if segue.destination.isKind(of: PVC.self) {
                    pageViewController = (segue.destination as! PVC)
                }
            }
        }

    @IBAction func selected(_ sender: pageViewButton) {
        for button in buttons {
            button.isSelected = false
        }
        
        sender.isSelected = true
        
        if sender.currentTitle == "Charity" {
            pageViewController.setViewControllerFromIndex(index: 0)
        } else if sender.currentTitle == "Offers" {
            pageViewController.setViewControllerFromIndex(index: 1)
        } else {
            pageViewController.setViewControllerFromIndex(index: 2)
        }
    }
}
