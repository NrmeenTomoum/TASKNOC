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
    func configCell (serverName : String, ipAddress : String,  deviceIPSubnetMask : String, status : Int  )
    {
        name.text = serverName
        self.ipAddress.text = ipAddress
        self.deviceIPSubnetMask.text = deviceIPSubnetMask
        //2 orange if 3 yellow if 4 red
        if status == 1
        {
            statusImageColor.backgroundColor = UIColor.green
        }
       else if status == 2
        {
            statusImageColor.backgroundColor = UIColor.orange
        }
        else if status == 3
        {
            statusImageColor.backgroundColor = UIColor.yellow
        }
        else if status == 4
        {
            statusImageColor.backgroundColor = UIColor.red
        }
        else
        {
            statusImageColor.backgroundColor = UIColor.clear
        }
    }
    
}
