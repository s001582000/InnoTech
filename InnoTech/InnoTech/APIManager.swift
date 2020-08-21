//
//  APIManager.swift
//  InnoTech
//
//  Created by 梁雅軒 on 2020/8/21.
//  Copyright © 2020 梁雅軒. All rights reserved.
//

import Foundation
import Alamofire
class APIManager {
    static let share = APIManager()
    func loadData(_ callBack: @escaping([PhotoInfo]?)->()) {
        let url = "https://jsonplaceholder.typicode.com/photos"
        AF.request(url).response { (response) in
            if let data = response.data {
                if let photos = data.toObj(type: [PhotoInfo].self){
                    callBack(photos)
                }else{
                    callBack(nil)
                }
            }else{
                callBack(nil)
            }
        }
    }
}
