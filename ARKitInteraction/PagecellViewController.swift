//
//  PagecellViewController.swift
//  ARKitInteraction
//
//  Created by admin on 2021/6/6.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class PagecellViewController: UITableViewCell {

 

    @IBOutlet var detail: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
