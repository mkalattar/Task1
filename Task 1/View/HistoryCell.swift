//
//  HistoryCell.swift
//  Task 1
//
//  Created by Mohamed Attar on 05/10/2021.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    @IBOutlet weak var organizationImageView: UIImageView!
    @IBOutlet weak var organizationNameLabel: UILabel!
    @IBOutlet weak var charityTypeLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        organizationImageView.layer.cornerRadius = 5
        organizationImageView.clipsToBounds = true
        
        // Shadow Configuration
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowColor = UIColor.systemGray.cgColor

        // Corner Radius Configuration
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 7
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Adding padding to the cell
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 7, bottom: 7, right: 7))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDetails(details: String) {
        detailsLabel.text = details
    }
    func setCharityType(charity: String) {
        charityTypeLabel.text = charity
    }
    func setOrganization(organization: String) {
        organizationNameLabel.text = organization
    }
    func setDonationAmount(amount: Int) {
        valueLabel.text = "\(amount) LE"
    }
    func setTimestamp(timestamp: String) {
        timestampLabel.text = timestamp
    }
    func setImage(image: UIImage?) {
        if let image = image {
            organizationImageView.image = image
        }
    }
}
