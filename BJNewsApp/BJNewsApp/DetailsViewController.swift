//
//  DetailsViewController.swift
//  BJNewsApp
//
//  Created by Shubhang Dixit on 29/08/19.
//  Copyright © 2019 Shubhang. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var newsBackgroundImageView: UIImageView!
    @IBOutlet weak var newsDetailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var news : NewsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIForSubView()
        loadContent()
    }
    
    func configureUIForSubView() {
        let gradient = CAGradientLayer()
        gradient.frame = newsBackgroundImageView.bounds
        gradient.colors = [
            UIColor.init(white: 0, alpha: 0).cgColor,
            UIColor.black.cgColor
        ]
        newsBackgroundImageView.backgroundColor = .clear
        newsBackgroundImageView.layer.insertSublayer(gradient, at: 0)
        
        backButton.layer.cornerRadius = 25
        backButton.layer.masksToBounds = true
        backButton.imageEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
    }
    
    func loadContent() {
        titleLabel.text = news?.title
        sourceLabel.text = news?.source
        dateLabel.text = news?.publishedAt
        newsDetailLabel.text = news?.content
        if let imageUrl = news?.urlToImage {
            newsBackgroundImageView.loadImageUsingCache(withUrl: imageUrl)
        }
    }

    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
