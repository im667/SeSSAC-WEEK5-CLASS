//
//  NewViewController.swift
//  SeSSAC-WEEK5-CLASS
//
//  Created by mac on 2021/10/26.
//

//
//  ViewController.swift
//  LotteryProject
//
//  Created by mac on 2021/10/25.
//
//
//import UIKit
//import Alamofire
//import SwiftyJSON
//
//class NewViewController: UIViewController {
//
//
//    @IBOutlet weak var tempLabel: UILabel!
//
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        getWeather()
//
//    }
//
//
//    func getWeather(){
//
//        let url = "https://api.openweathermap.org/data/2.5/box/city?bbox=12,32,15,37,10&appid=69f4c041bdfafce7925e677a1079844e"
//        //비공개
//
//        AF.request(url, method: .get).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value): //성공했을 때(let 연관값)
//                let json = JSON(value)
//                print("JSON: \(json)")
//                let temp = json["main"]["temp"].doubleValue
//                              self.tempLabel.text = "\(Int(temp))"
//                              print("JSON: \(json)")
//
//            case .failure(let error): //실패했을 때
//                print(error)
//            }
//        }
//    }
//}
//
