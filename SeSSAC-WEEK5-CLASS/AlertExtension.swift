//
//  AlertExtension.swift
//  SeSSAC-WEEK5-CLASS
//
//  Created by mac on 2021/10/25.
//

import UIKit

extension UIViewController {
    
    func showAlert(title:String, message:String, okTitle:String, okAction: @escaping ()->() ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        let ok = UIAlertAction(title: okTitle, style: .default) { _ in
            print("확인")
            
            okAction()
            
         
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true) {
            print("얼럿이 떴습니다.")
        }
    }
}
