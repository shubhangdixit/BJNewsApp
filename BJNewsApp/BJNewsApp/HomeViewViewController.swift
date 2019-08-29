//
//  HomeViewViewController.swift
//  BJNewsApp
//
//  Created by Shubhang Dixit on 29/08/19.
//  Copyright © 2019 Shubhang. All rights reserved.
//

import UIKit

class HomeViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUIforSubViews()
        
        self.view.bringSubviewToFront(activityIndicator)
        activityIndicator.startAnimating()
        
        tableView.dataSource = self
        tableView.delegate = self
        loadContent()
    }
    
    func configureUIforSubViews() {
        
        view.backgroundColor = UIColor(displayP3Red: 32/255, green: 32/255, blue: 32/255, alpha: 1)
        
        topView.layer.masksToBounds = false
        topView.layer.shadowColor = UIColor.black.cgColor
        topView.layer.shadowOpacity = 0.5
        topView.layer.shadowOffset = CGSize(width: 0, height: 2)
        topView.layer.shadowRadius = 1
        
        topView.layer.shadowPath = UIBezierPath(rect: topView.bounds).cgPath
        topView.layer.shouldRasterize = true
        view.bringSubviewToFront(topView)
    }
    
    func loadContent() {
        ContentManager.shared.loadHighLights(forCountry: Country.us, category: nil, success: {[weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
            }
        }) {
            print("loadFailed")
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContentManager.shared.newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell : ArticleCell = self.tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as? ArticleCell {
            cell.configureCell(forNews: ContentManager.shared.newsList[indexPath.row])
            return cell
        } else {
            return UITableViewCell.init()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 208.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController : DetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            viewController.news = ContentManager.shared.newsList[indexPath.row]
            self.present(viewController, animated: true, completion: nil)
        }
    }
}
