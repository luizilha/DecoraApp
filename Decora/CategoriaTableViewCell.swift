//
//  CategoriaTableViewCell.swift
//  Decora
//
//  Created by Luiz Ilha on 29/12/16.
//  Copyright © 2016 Luiz Ilha. All rights reserved.
//

import UIKit

class CategoriaTableViewCell: UITableViewCell {
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblDescricao: UILabel!
    @IBOutlet weak var imgCapa: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
