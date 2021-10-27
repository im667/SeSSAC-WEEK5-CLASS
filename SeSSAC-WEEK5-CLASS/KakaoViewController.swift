//
//  KakaoViewController.swift
//  SeSSAC-WEEK5-CLASS
//
//  Created by mac on 2021/10/27.
//

import UIKit
import SwiftyJSON

class KakaoViewController: UIViewController {

    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func requsetButtonClicked(_ sender: UIButton) {
        
        VisionAPIManager.shared.fetchFaceData(image: postImageView.image!) { code, json in
            print(json)
        }
        
    }
 

}
