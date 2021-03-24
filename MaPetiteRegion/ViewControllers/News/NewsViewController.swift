//
//  NewsViewController.swift
//  MaPetiteRegion
//
//  Created by  on 17/02/2021.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var infosObject:InfosElement?
    var selectedIndex = 0
    
    var newsModel = [NewsModelUI]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewsDescritpion" {
            if let destVC = segue.destination as? NewsDetailViewController {
                destVC.modelUI = newsModel[selectedIndex-1]
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NetworkManager.instance.getInfos(city: CityManager.instance.currentCity) {
            infos in
            
            self.newsModel = NewsModelUI.createModelsFromJsonModel(model: infos)
            
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 183
        } else {
            return 232 + 30
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + newsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Head") as? HeadTableViewCell {
                
                cell.setup(m: NewsHeadModelUI.aixDefault())
            
                return cell
                
            } else {
                return UITableViewCell()
            }
            
        } else {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "News") as? NewsTableViewCell {
                
                cell.setup(m: newsModel[indexPath.row-1])
            
                return cell
                
            } else {
                return UITableViewCell()
            }

        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index: \(indexPath.row)")
        if indexPath.row != 0 {
            selectedIndex = indexPath.row
            self.performSegue(withIdentifier: "toNewsDescritpion", sender: self)
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
