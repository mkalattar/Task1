//
//  ModelManager.swift
//  Task 1
//
//  Created by Mohamed Attar on 06/10/2021.
//

import UIKit


struct ModelManager {
    var history = [History]()
    static var shared = ModelManager()
    
    private init() {}
    
    mutating func addToHistory(organizationImage: UIImage?, organizationName: String, charityType: CharityType, timestamp: String, amount: Int, details: String) {
        let toAdd = History(organizationImage: organizationImage, organizationName: organizationName, charityType: charityType, timestamp: timestamp, donationAmount: amount, details: details)
        
        history.append(toAdd)
    }
    func getHistory() -> [History] {
        return history
    }
}
