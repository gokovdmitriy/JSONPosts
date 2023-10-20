//
//  PostTableViewCell.swift
//  TestTaskJSONPosts
//
//  Created by MacBook Pro  on 16.10.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBAction func buttonPressed(_ sender: UIButton) {
    }
    @IBOutlet weak var previewText: UILabel!
    @IBOutlet weak var timeshamp: UILabel!
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
