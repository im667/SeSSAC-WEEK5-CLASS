//
//  PapagoViewController.swift
//  SeSSAC-WEEK5-CLASS
//
//  Created by mac on 2021/10/26.
//

import UIKit
import Alamofire
import SwiftyJSON

class PapagoViewController: UIViewController {

    
    @IBOutlet weak var sourceTextView: UITextView!
    
    @IBOutlet weak var targetTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
 
        
        
    }
    
    @IBAction func translateButtonClicked(_ sender: UIButton) {
        
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        let header: HTTPHeaders = [
            "X-Naver-Client-Id":"pCD7fvTZfdSST7e7Uf5r",
            "X-Naver-Client-Secret":"9Fy1tKyG9O"
        ]
        
        let parameters = [
            "source":"ko",
            "target":"en",
            "text":sourceTextView.text!
        ]
        
        AF.request(url, method: .post, parameters: parameters, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                let result = json["result"]["translatedText"].stringValue
                self.targetTextView.text = result
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }

        
    }
    

}
