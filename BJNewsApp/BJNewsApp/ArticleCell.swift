//
//  ArticleCell.swift
//  BJNewsApp
//
//  Created by Shubhang Dixit on 29/08/19.
//  Copyright © 2019 Shubhang. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gradientView: UIView!
    
    var news : NewsModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let gradient = CAGradientLayer()
        gradient.frame = newsImageView.bounds
        gradient.colors = [
            UIColor.init(white: 0, alpha: 0).cgColor,
            UIColor.black.cgColor,
            UIColor.black.cgColor
        ]
        newsImageView.backgroundColor = .clear
        newsImageView.layer.insertSublayer(gradient, at: 0)
        
        gradientView.layer.cornerRadius = 3.0
        gradientView.layer.masksToBounds = true
        
    }
    
    func configureCell(forNews newsArticle : NewsModel) {
        news = newsArticle
        titleLabel.text = news?.title
        sourceLabel.text = news?.source
        dateLabel.text = news?.publishedAt
        if let imageUrl = news?.urlToImage {
            newsImageView.loadImageUsingCache(withUrl: imageUrl)
        }
    }
}
