//
//  VisionAPIManager.swift
//  SeSSAC-WEEK5-CLASS
//
//  Created by mac on 2021/10/27.
//
import UIKit.UIImage
import SwiftyJSON
import Alamofire


class VisionAPIManager {
    static let shared = VisionAPIManager()
    
    func fetchFaceData(image:UIImage, result:@escaping(Int, JSON)->() ){
        
        let header: HTTPHeaders = [
            "Authorization": APIKey.KAKAO,
            "Content-Type": "multipart/form-data"
            ]
        //UIIamge를 바이너리 타입으로 변환
        guard let imageData = image.pngData() else { return }
                 
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image", fileName: "image")
        }, to: Endpoint.visionURL, headers: header)
           .validate(statusCode: 200...500).responseJSON { response in
                    
                    switch response.result {
                    case .success(let value):
                        
                        let json = JSON(value)
                        print("JSON: \(json)")
                        
                        let code = response.response?.statusCode ?? 500

                        result(code, json)
                        
                    case .failure(let error):
                        print(error)
                    }
                }
        
    }
    
}
