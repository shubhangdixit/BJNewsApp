//
//  NetworkManager.swift
//  BJNewsApp
//
//  Created by Shubhang Dixit on 28/08/19.
//  Copyright © 2019 Shubhang. All rights reserved.
//

import Foundation

public enum BJNewsAPIEndPoint : String {
    case headLines = "https://newsapi.org/v2/top-headlines"
    case everything = "https://newsapi.org/v2/everything"
}

class NetworkManager {
    
    static let shared = NetworkManager()
    typealias successBlock  = (Data?) -> Void
    typealias failureBlock = (Error?)-> Void
    
    func getData(forNewsType type : BJNewsAPIEndPoint, payload : [String : String], success: @escaping successBlock, failure: @escaping failureBlock) {
        
        var finalPayload = payload
        finalPayload["apiKey"] = getAPIKey()
        performRequest(forUrl: self.getURL(forEndPoint: type, payload: finalPayload), requestType: "GET", success: { data in
            success(data)
        }) { error in
            failure(error)
        }
        
         
    }
    
    func performRequest(forUrl url : String, requestType : String, success: @escaping successBlock, failure: @escaping failureBlock) {
        let request: NSMutableURLRequest = NSMutableURLRequest(url: URL(string: url)!)
        request.httpMethod = requestType
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if let apiError = error {
                failure(apiError)
            } else {
                if let result = data {
                    success(result)
                }
            }
        })
        task.resume()
    }
    
    fileprivate func getAPIKey() -> String {
        var plistDict: NSDictionary?
        if let path = Bundle.main.path(forResource: "NewsApi", ofType: "plist") {
            plistDict = NSDictionary(contentsOfFile: path)
        }
        return plistDict?.object(forKey: "APIKey") as! String
    }
    
    func getURL(forEndPoint type: BJNewsAPIEndPoint, payload : [String : String]) -> String {
        var urlString = type.rawValue
        if payload.count > 0 {
            urlString += "?"
            for key in payload.keys {
                let querry : String = key + "=" + (payload[key] ?? "")
                urlString += querry
                urlString += "&"
            }
            urlString = String(urlString.dropLast())
        }
        return urlString
    }
}
