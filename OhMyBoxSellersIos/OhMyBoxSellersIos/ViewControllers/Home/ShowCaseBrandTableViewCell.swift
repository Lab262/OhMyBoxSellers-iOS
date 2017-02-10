//
//  ShowCaseBrandTableViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 31/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ShowCaseBrandTableViewCell: UITableViewCell {
    
    @IBOutlet weak var followButton: UIButton!
    
    @IBOutlet weak var followLabel: UILabel!

    @IBOutlet weak var brandImage: UIImageView!
    
    @IBOutlet weak var titleBrandLabel: UILabel!
    
    @IBOutlet weak var subtitleBrandLabel: UILabel!

    static let identifier = "showCaseBrandCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.followButton.setImage(#imageLiteral(resourceName: "containerFollow_button"), for: .normal)
        self.followButton.setImage(#imageLiteral(resourceName: "containerUnfollow_button"), for: .selected)
    }
    
    @IBAction func clickedFollowButton(_ sender: Any) {
        
        if self.followButton.isSelected {
            self.followButton.isSelected = false
            self.followLabel.text = "Seguir"
            
            
            
            self.followButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn
            )
            self.followButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
            self.followLabel.textColor = UIColor.colorWithHexString("241932")
            
        } else {
            self.followButton.isSelected = true
            self.followLabel.text = "Seguindo"
            self.followButton.bouncingAnimation(true, duration: 0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0, animationOptions: .curveEaseIn)
            self.followButton.fadeIn(0.1, delay: 0.0, completion: {finished in}, finalAlpha: 1.0)
            self.followLabel.textColor = UIColor.white
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
