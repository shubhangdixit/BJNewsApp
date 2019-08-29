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
        gradient.frame = gradientView.bounds
        gradient.colors = [
            UIColor.init(white: 0, alpha: 0).cgColor,
            UIColor.black.cgColor
        ]
        gradientView.backgroundColor = .clear
        gradientView.layer.insertSublayer(gradient, at: 0)
        
    }
    
    func configureCell(forNews newsArticle : NewsModel) {
        self.news = newsArticle
        self.titleLabel.text = news?.title
        self.sourceLabel.text = news?.source
        self.dateLabel.text = news?.publishedAt
        
    }
}
