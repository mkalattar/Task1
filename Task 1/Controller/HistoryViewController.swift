//
//  HistoryViewController.swift
//  Task 1
//
//  Created by Mohamed Attar on 06/10/2021.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var history = [History]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding some mock data
        addMockData()
        
        // Configuring TableView DataSource and NibFile
        configureTableView()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        let homeVC = HomeViewController()
//        homeVC.selectHistoryButton()
//    }
    
    
    func addMockData() {
        
        let image = UIImage(named: "org")
        
        ModelManager.shared.addToHistory(organizationImage: image, organizationName: "Facebook", charityType: .education, timestamp: "May 12, 2018 12:08PM", amount: 1000, details: "Donating for some Child Services campaign Facebook decided to make after a big scandal, something really bad. SMH.")
        ModelManager.shared.addToHistory(organizationImage: image, organizationName: "Apple", charityType: .enviroment, timestamp: "Mar 01, 2020 11:59AM", amount: 1500, details: "Apple decided to collect donation to help the enviroment after taking out the charger from the new phones boxes. Everyone has a charger nowadays right? Just not the USB C that the cable comes with but who cares about dat.")
        ModelManager.shared.addToHistory(organizationImage: nil, organizationName: "HSBC", charityType: .health, timestamp: "Oct 31, 2021 5:00PM", amount: 500, details: "A Hospital decided to collect donates for cancer patients")
        ModelManager.shared.addToHistory(organizationImage: nil, organizationName: "Google", charityType: .animal, timestamp: "Jan 01, 2022 1:00AM", amount: 300, details: "Donating for some Animal Services campaign Google decided to make after a big scandal, Donating for some Animal Services campaign Google decided to make after a big scandal, Donating for some Animal Services campaign Google decided to make after a big scandal, Donating for some Animal Services campaign Google decided to make after a big scandal")
        
        history = ModelManager.shared.getHistory()
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HistoryCell", bundle: nil), forCellReuseIdentifier: "historyCell")
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
    }
}


extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryCell
        
        let historyCell = history[indexPath.row]
        
        cell.setDetails(details: historyCell.details)
        cell.setOrganization(organization: historyCell.organizationName)
        cell.setCharityType(charity: historyCell.charityType.rawValue)
        cell.setImage(image: historyCell.organizationImage)
        cell.setTimestamp(timestamp: historyCell.timestamp)
        cell.setDonationAmount(amount: historyCell.donationAmount)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
        
        // Smooth scrolling
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
    
}
