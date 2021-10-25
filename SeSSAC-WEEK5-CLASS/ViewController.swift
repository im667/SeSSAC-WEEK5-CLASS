//
//  ViewController.swift
//  SeSSAC-WEEK5-CLASS
//
//  Created by mac on 2021/10/25.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        getCurrentWeather()
    }

    func getCurrentWeather(){
        
        let url = "https://api.openweathermap.org/data/2.5/box/city?bbox=12,32,15,37,10&appid=69f4c041bdfafce7925e677a1079844e"
        
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value): //성공했을 때(let 연관값)
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error): //실패했을 때
                print(error)
            }
        }
    }
}

