//
//  NewsTableViewCell.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit
import AlamofireImage

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsHat: UILabel!
    @IBOutlet weak var textBGView: UIView!
    @IBOutlet weak var fullContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(m: NewsModelUI) {
        self.selectionStyle = .none
        fullContentView.backgroundColor = UIContext.Colors.News.cellBGColor
        fullContentView.layer.cornerRadius = 30
        textBGView.backgroundColor = UIContext.Colors.News.cellBGColor
        // newsImage.image = UIImage(named: m.imageUrl)

        
        
        if let url = URL(string: m.imageUrl) {
            let request = URLRequest(url: url)
            
            newsImage.af.setImage(withURLRequest: request,
                                  cacheKey: m.imageUrl,
                                  placeholderImage: UIImage(named: "annecy_bg"),
                                  serializer: nil,
                                  filter: nil,
                                  progress: nil,
                                  progressQueue: .global(),
                                  imageTransition: .noTransition,
                                  runImageTransitionIfCached: false) {
                response in
                if let e = response.error {
                    print(e)
                    self.newsImage.image = UIImage(named: "annecy_bg")
                }
                
            }
            
            //newsImage.af.setImage(withURL: url)
        }
        newsTitle.text = m.title
        newsHat.text = m.hat
    }

}
