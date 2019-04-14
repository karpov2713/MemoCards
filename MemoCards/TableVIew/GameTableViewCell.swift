//
//  GameTableViewCell.swift
//  MemoCards
//
//  Created by Дмитрий Карпов on 01/04/2019.
//  Copyright © 2019 MacKarpov. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var indexCellLabel: UILabel!
    @IBOutlet weak var nameOfGameCellLabel: UILabel!
    @IBOutlet weak var firstNumberCellLabel: UILabel!
    @IBOutlet weak var directionImage: UIImageView!
    @IBOutlet weak var endNumberCellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func prepareForReuse() {
        contentView.backgroundColor = .white
    }

}
