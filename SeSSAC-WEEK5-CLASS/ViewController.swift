////
////  ViewController.swift
////  LotteryProject
////
////  Created by mac on 2021/10/25.
////
//
//import UIKit
//import Alamofire
//import SwiftyJSON
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var textField: UITextField!
//    
//    @IBOutlet weak var dateLabel: UILabel!
//    
//    @IBOutlet weak var roundLabel: UILabel!
//    
//    @IBOutlet weak var resultLabel: UILabel!
//    
//    @IBOutlet weak var roundPickerView: UIPickerView!
//    
//    
//    var selcetRound = ""
//    var pickerDate = [1...903]
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       
////        roundPickerView.delegate = self
////        roundPickerView.dataSource = self
////
//        
//        getCrurrentWeather()
//        
//    }
//
//    
//    
//    
//    
//    
//    func getCrurrentWeather(){
//        
//        let url = "https://api.openweathermap.org/data/2.5/box/city?bbox=12,32,15,37,10&appid=69f4c041bdfafce7925e677a1079844e"
//        //비공개
//        
//        AF.request(url, method: .get).validate().responseJSON { response in
//            switch response.result {
//            case .success(let value): //성공했을 때(let 연관값)
//                let json = JSON(value)
//                let temp = json["main"]["temp"].doubleValue - 273.15
//                self.tempLabel.text = "\(Int(temp))"
//                print("JSON: \(json)")
//            case .failure(let error): //실패했을 때
//                print(error)
//            }
//        }
//    }
//}
//
