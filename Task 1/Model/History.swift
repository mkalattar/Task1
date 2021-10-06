//
//  History.swift
//  Task 1
//
//  Created by Mohamed Attar on 06/10/2021.
//

import UIKit

enum CharityType: String {
    case health = "Health"
    case education = "Education"
    case enviroment = "Enviroment"
    case animal = "Animal"
}

struct History {
    let organizationImage: UIImage?
    let organizationName: String
    let charityType: CharityType
    let timestamp: String
    let donationAmount: Int
    let details: String
}
