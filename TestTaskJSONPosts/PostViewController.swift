import UIKit
import Alamofire
import SDWebImage


class PostViewController: UIViewController
{
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var heartCount: UILabel!
    @IBOutlet weak var textDescription: UILabel!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var postedTime: UILabel!
    
    var postInformation: Post?
    var postID: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        getPostInformationById()
    }
    
    func getPostInformationById(){
        
        let urlGetPostInfo: String = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/"
        let json: String = ".json"
        let url: String = urlGetPostInfo+String((postID?.postId)!)+json
        
        
        //        AF.request(url)
        //                    .responseDecodable(of: PostServerResponce.self, completionHandler: { [weak self] data in
        //
        //                        guard let self, case let .success(response) = data.result
        //                        else
        //                        {
        //                            return
        //
        //                        }
        //
        //                        self.postInformation = response.post
        //
        AF.request(url).responseJSON { [self] responce in
            
            let jsonDecoder = JSONDecoder()
            do
            {
                let responseModel = try! jsonDecoder.decode(PostServerResponce.self, from: responce.data!)
                self.postInformation = responseModel.post!
                
            }
            nameTitle.text = self.postInformation?.title
            if let postTimestamp = postInformation?.timeshamp {
                let formattedTime = formatDate(postTimestamp)
                postedTime.text = formattedTime
                textDescription.text = self.postInformation?.text
                let likesToText = "\(postInformation?.likes_count ?? 0)"
                heartCount.text = likesToText
                guard let url = URL(string: (self.postInformation?.postImage)!) else {return}
                postImage.sd_setImage(with: url)
            }
        }
        
        
        
        
        func formatDate(_ timestamp: Int?) -> String {
            guard let timestamp = timestamp else {
                return ""
            }
            
            let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_GB")
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd-YYYY")
            
            return dateFormatter.string(from: date)
        }
    }
}

