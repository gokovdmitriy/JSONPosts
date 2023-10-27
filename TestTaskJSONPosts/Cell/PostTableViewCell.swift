import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var previewText: UILabel!
    @IBOutlet weak var timeshamp: UILabel!
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var title: UILabel!
    
    weak var delegate: PostTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        delegate?.didTapExpandButton(in: self)
    }
    
}

