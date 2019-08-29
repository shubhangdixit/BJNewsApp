//
//  ContentManager.swift
//  BJNewsApp
//
//  Created by Shubhang Dixit on 29/08/19.
//  Copyright © 2019 Shubhang. All rights reserved.
//

import Foundation

enum Country: String {
    case ae = "ae", ar, at, au, be, bg, br, ca, ch, cn, co, cu, cz, de, eg, fr, gb, gr, hk, hu, id, ie, il, india = "in", it, jp, kr, lt, lv, ma, mx, my, ng, nl, no, nz, ph, pl, pt, ro, rs, ru, sa, se, sg, si, sk, th, tr, tw, ua, us = "us", ve, za
}

enum Category: String {
    case business = "business", entertainment = "entertainment", general = "general", health, science, sports, technology
}
class ContentManager {
    static let shared = ContentManager()
    typealias successBlock  = () -> Void
    typealias failureBlock = ()-> Void
    var newsList : [NewsModel] = []
    
    
    func loadHighLights(forCountry country: Country?, category: Category?, success : @escaping successBlock, failure : @escaping failureBlock) {
        var payload : [String:String] = [:]
        if let country = country {
            payload["country"] = country.rawValue
        }
        if let category = category {
            payload["category"] = category.rawValue
        }
        NetworkManager.shared.getData(forNewsType: .headLines, payload: payload, success: {[weak self] data in
            do {
                if let parsedData = try JSONSerialization.jsonObject(with: data!) as?
                    [String:Any] {
                    if let articles = parsedData["articles"] as? [[String:Any]] {
                        for article in articles {
                            self?.newsList.append(NewsModel(withDictionary: article))
                        }
                        success()
                    } else {
                        failure()
                    }
                } else {
                    failure()
                }
            } catch let error as NSError {
                print(error.description)
                failure()
            }
            
        }) { _ in
            failure()
        }
    }
}

