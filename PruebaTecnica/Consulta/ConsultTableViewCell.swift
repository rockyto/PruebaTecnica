//
//  ConsultTableViewCell.swift
//  PruebaTecnica
//
//  Created by Rodrigo Sánchez on 15/04/23.
//

import UIKit

class ConsultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEdad: UILabel!
    @IBOutlet weak var lblMail: UILabel!

    @IBOutlet weak var imageSelfie: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
