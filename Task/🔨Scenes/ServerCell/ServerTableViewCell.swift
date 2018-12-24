//
//  ServerTableViewCell.swift
//  Task
//
//  Created by Nrmeen Tomoum on 12/22/18.
//  Copyright © 2018 MobileNOC. All rights reserved.
//

import UIKit

class ServerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var ipAddress: UILabel!
    @IBOutlet weak var deviceIPSubnetMask: UILabel!
    @IBOutlet weak var statusImageColor: ProfileImage!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
                        shadowView.layer.shadowColor = UIColor.gray.cgColor
                        shadowView.layer.shadowOpacity = 0.5
                        shadowView.layer.shadowOffset = CGSize.zero
                        shadowView.layer.shadowRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell (serverName : String, ipAddress : String,  deviceIPSubnetMask : String )
    {
        
    }
    
}
