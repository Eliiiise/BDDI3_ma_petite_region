//
//  NewsDetailViewController.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit
import AlamofireImage

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fullContentView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var modelUI:NewsModelUI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let model = modelUI {
            
            if let url = URL(string: model.imageUrl) {
                let request = URLRequest(url: url)
                
                imageView.af.setImage(withURLRequest: request,
                                      cacheKey: model.imageUrl,
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
                        self.imageView.image = UIImage(named: "annecy_bg")
                    }
                }
                // imageView.af.setImage(withURL: url)
            }
            // imageView.image = UIImage(named: model.imageUrl)
            dateLabel.text = model.date
            titleLabel.text = model.title
            textView.text = model.fullContent
            fullContentView.layer.cornerRadius = 20
        }
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
