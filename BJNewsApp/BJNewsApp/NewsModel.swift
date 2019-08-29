//
//  NewsModel.swift
//  BJNewsApp
//
//  Created by Shubhang Dixit on 29/08/19.
//  Copyright © 2019 Shubhang. All rights reserved.
//

import Foundation
class NewsModel {
    var source : String?
    var author : String?
    var title : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
    var content : String?
    
    let jsonKeys = NewsAPIJsonKeys()
    
    init(withDictionary dictionary : [String: Any]) {
        if let sourceDict = dictionary[jsonKeys.source] as? [String:Any] {
            source = sourceDict["name"] as? String
        }
        author = dictionary[jsonKeys.author] as? String
        title = dictionary[jsonKeys.title] as? String
        url = dictionary[jsonKeys.url] as? String
        urlToImage = dictionary[jsonKeys.urlToImage] as? String
        publishedAt = dictionary[jsonKeys.publishedAt] as? String
        publishedAt = String(publishedAt?.prefix(10) ?? "")
        content = dictionary[jsonKeys.content] as? String
    }
}
