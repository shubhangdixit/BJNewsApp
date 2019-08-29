//
//  HomeViewViewController.swift
//  BJNewsApp
//
//  Created by Shubhang Dixit on 29/08/19.
//  Copyright © 2019 Shubhang. All rights reserved.
//

import UIKit

class HomeViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ContentManager.shared.loadHighLights(forCountry: Country.us, category: nil, success: {
            
        }) {
            
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
