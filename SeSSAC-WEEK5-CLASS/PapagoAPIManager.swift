//
//  PapagoAPIManager.swift
//  SeSSAC-WEEK5-CLASS
//
//  Created by mac on 2021/10/27.
//

import Foundation
import SwiftyJSON
import Alamofire

class PapagoAPIManager {
    
    static let shared = PapagoAPIManager()
    
    typealias CompletionHandler = (Int, JSON) -> ()
    
    func fetchPapagoData(text:String, result: @escaping (Int, JSON)->() ) {
        
        let url = Endpoint.translatedURL
        let header: HTTPHeaders = [
            "X-Naver-Client-Id":APIKey.NAVER_ID,
            "X-Naver-Client-Secret":APIKey.NAVER_SECRET
        ]
        
        let parameters = [
            "source":"ko",
            "target":"en",
            "text": text
        ]
        
        
        //1. 상태코드 :.validate(statusCode: 200...500)
        //2. 상태코드 분기
        AF.request(url, method: .post, parameters: parameters, headers: header).validate(statusCode: 200...500).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("json: \(json)")
                
                let code = response.response?.statusCode ?? 500
                
                
                result(code, json)
                

                
                
                
//                let result = json["result"]["translatedText"].stringValue
//                self.targetTextView.text = result
                
                print("JSON: \(json)")
            case .failure(let error):
                print(error) //네트워크 통신 자체가 안되는 경우
            }
        }
        
        
    }
    
}
