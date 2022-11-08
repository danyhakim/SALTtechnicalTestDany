//
//  Network.swift
//  SALT Technical Test App
//
//  Created by Dany Elita on 08/11/22.
//  Copyright © 2022 Dany Hakim. All rights reserved.
//

import Foundation
 

class Network:NSObject{
    let loginUrl = "https://reqres.in/api/login"
    let userUrl = "https://reqres.in/api/users/"

    func getLoginAccess(username:String, password:String, completion : @escaping (String,String) -> ()){
        var request = URLRequest(url: URL(string: loginUrl)!)
            request.httpMethod = "POST"
        let userData = ["email":username,"password":password]
        request.httpBody = try! JSONEncoder().encode(userData)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")

           URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
               if let data = data {
                
                if let results = try! JSONSerialization.jsonObject(with: data) as? [String:String]{
                    print(results)
                    if let token = results["token"]{
                        completion(token,"")
                    }
                    else{
                        if let error = results["error"]{
                            completion("",error)
                        }
                    }
                }

               }
           }.resume()
       }
    
    func getUserDetails(uid:Int,completion : @escaping (User) -> ()){
     var request = URLRequest(url: URL(string: userUrl+String(describing: uid))!)
         request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
             let userData = try! jsonDecoder.decode(User.self, from: data)
                    completion(userData)
            }
        }.resume()
    }
    
    
}
