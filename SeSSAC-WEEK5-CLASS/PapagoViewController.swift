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
    
    var translateText: String = "" {
        didSet{
            targetTextView.text = translateText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func translateButtonClicked(_ sender: UIButton) {
        
       
        //1.
//        if let value = sourceTextView.text {
//            PapagoAPIManager.shared.fetchPapagoData(text: value)
//        }
        
        //2,
        guard let text = sourceTextView.text else {
            return }
        PapagoAPIManager.shared.fetchPapagoData(text: text) { code, json in
            
            switch code {
            case 200:
                print(json)
                self.translateText = json["message"]["result"]["translatedText"].stringValue
            case 400:
                print(json)
                self.translateText = json["errorMessage"].stringValue
            default:
                print("ERROR")
                
                }
            
            }
        
        }
         
    }
    


