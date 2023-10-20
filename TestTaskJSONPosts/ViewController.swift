import Alamofire
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayOfPosts: [Posts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPost()
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        
    }
    func getPost(){
        let url: String = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
        
        AF.request(url).responseJSON { responce in
            
            let jsonDecoder = JSONDecoder()
            do
            {
                let responseModel = try! jsonDecoder.decode(ServerResponce.self, from: responce.data!)
                self.arrayOfPosts = responseModel.posts!
                //print(self.arrayOfPosts)
                self.tableView.reloadData()
                
            }
        }
        
    }
    func formatDate(_ timestamp: Int?) -> Int {
        guard let timestamp = timestamp else {
            return 0
        }
        let currentDate = Date()
        let today = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let calendar = Calendar.current
        let daysDifference = calendar.dateComponents([.day], from: today, to: currentDate).day
        return daysDifference ?? 00    }
}


extension ViewController: UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = main.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController {
            viewController.postIDFromArray = self.arrayOfPosts[indexPath.row]
            self.navigationController?.pushViewController(viewController, animated: true)
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 220
    }
}

extension ViewController: UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfPosts.count
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        "PostTableViewCell", for: indexPath) as? PostTableViewCell
        else{ return PostTableViewCell() }
        cell.selectionStyle = .none
        if let postTime = arrayOfPosts[indexPath.row].timeshamp
        {
            let formattedTime = formatDate(postTime)
            cell.timeshamp.text = "\(formattedTime) days ago"
            
        }
        cell.likesCount.text = String(arrayOfPosts[indexPath.row].likes_count!)
        cell.previewText.text = arrayOfPosts[indexPath.row].preview_text!
        cell.title.text = arrayOfPosts[indexPath.row].title!
        return cell
        
    }
}
