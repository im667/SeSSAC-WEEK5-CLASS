//
//  OpenWeatherMapViewController.swift
//  SeSSAC-WEEK5-CLASS
//
//  Created by mac on 2021/10/25.
//
//commit2
import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation
import CoreLocationUI


class OpenWeatherMapViewController: UIViewController {
    
    static let identifier = "OpenWeatherMapViewController"
    var locationManager = CLLocationManager()
    var latitude:Double?
    var longitude:Double?
    
    
    @IBOutlet weak var dateLabel: UILabel!//현재날짜 
    @IBOutlet weak var locationLabel: UILabel!//현재위치
    @IBOutlet weak var tempLabel: UILabel!//온도
    @IBOutlet weak var huminLabel: UILabel!//습도
    @IBOutlet weak var windLabel: UILabel!//바람
    
    @IBOutlet weak var weatherImgView: UIImageView!//날씨 그림
    @IBOutlet weak var messageLabel: UILabel!//"오늘도 행복한 하루 보내세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        
      //포그라운드 상태에서 위치 추적 권한 요청
      locationManager.requestWhenInUseAuthorization()
             
    //배터리에 맞게 권장되는 최적의 정확도
     locationManager.desiredAccuracy = kCLLocationAccuracyBest
             
      //위치업데이트
       locationManager.startUpdatingLocation()
             
    //위도 경도 가져오기
      let coor = locationManager.location?.coordinate
     latitude = coor?.latitude
      longitude = coor?.longitude
        
        
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(clickedShareButton(_:)))
        
        let reFreshButton = UIBarButtonItem(barButtonSystemItem: .refresh , target: self, action:   #selector(clickedRefreshButton(_:)))
        
        
        self.navigationItem.rightBarButtonItems = [reFreshButton,shareButton]
        
       
      
        
    }

        @objc func clickedShareButton(_ sender:UIBarButtonItem){
            print("click")
        }
                                                                                
        @objc func clickedRefreshButton(_ sender:UIBarButtonItem){
         print("clickReFresh")
            
            if CLLocationManager.locationServicesEnabled() {
                        print("위치 서비스 On 상태")
                locationManager.requestWhenInUseAuthorization()
                    } else {
                        print("위치 서비스 Off 상태")
                        showAlert(title: "설정", message: "권한을 허용해주세요", okTitle: "설정으로 이동"){
                         
                            guard let url = URL(string: UIApplication.openSettingsURLString) else {
                                return
                            }

                            if UIApplication.shared.canOpenURL(url){
                                UIApplication.shared.open(url) { success in
                                    print("잘열였다. \(success)")
                                }
                            }
                        }
                     }
                    }
            
           
            
    

                                            
}
                                            
                                            

    extension OpenWeatherMapViewController: CLLocationManagerDelegate {
        
        
 
        func getLocationUsagePermisson(){
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            print("didUpdateLocations")
            
          
            if let coordinate = locations.last?.coordinate {
            
                locationManager.startUpdatingLocation()
                
                showLocationLabel(coordi: coordinate)
            }
            
        }
        
        func getCurrentAdress(location:CLLocation){
            let geoCoder : CLGeocoder = CLGeocoder()
            let location : CLLocation = location
            //한국어 주소 설정
            let locale = Locale(identifier: "Ko-kr")
            //위경도를 통해 주소 변환
            
            geoCoder.reverseGeocodeLocation(location, preferredLocale: locale, completionHandler: {(placemark,error)->Void in
                guard error == nil, let place = placemark?.first else {
                    print("주소설정 불가능")
                    return
                }
                
                if let administrativeArea = place.administrativeArea {
                    print(administrativeArea)
                }
                if let locality = place.locality {
                    print(locality)
                }
                if let subLocality = place.subLocality{
                    print(subLocality)
                }
                
                if let subThoroughfare = place.subThoroughfare{
                    print(subThoroughfare)
                }
            })
        }
        
        func showLocationLabel(coordi:CLLocationCoordinate2D){
            let geocoder = CLGeocoder()
            let findLocation = CLLocation(latitude: coordi.latitude, longitude: coordi.longitude)
            let locale = Locale(identifier: "Ko-kr")
            geocoder.reverseGeocodeLocation(findLocation, preferredLocale: locale, completionHandler: {(placemarks, error) in
                if let address : [CLPlacemark] = placemarks {
                    
                    let city = address[0].administrativeArea!
                    let gu = address[0].locality!
                    let dong = address[0].thoroughfare!

                    self.locationLabel?.text = "\(city) \(gu) \(dong)"
                }
                
            })
            
        }
}

