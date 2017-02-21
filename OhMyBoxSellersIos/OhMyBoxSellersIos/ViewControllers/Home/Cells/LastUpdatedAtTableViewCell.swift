//
//  LastUpdatedAtTableViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 21/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class LastUpdatedAtTableViewCell: UITableViewCell {

    static let identifier = "lastUpdatedAtCell"
    
    @IBOutlet weak var lastUpdatedAtLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    private var dateFormatter = DateFormatter()
    private var hourDateFormatter = DateFormatter()
    
    var lastUpdatedAt: Date? {
        didSet {
            if let lastUpdatedAt = lastUpdatedAt {
                lastUpdatedAtLabel.text = "Add: " + dateFormatter.string(from: lastUpdatedAt) + " às " + hourDateFormatter.string(from: lastUpdatedAt)
            } else {
                lastUpdatedAtLabel.text = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateFormatter.dateFormat = "dd/MM/yy"
        hourDateFormatter.dateFormat = "HH:mm"
        // Initialization code
    }
    
    @IBAction func editAction(_ sender: UIButton) {
        
    }
}
