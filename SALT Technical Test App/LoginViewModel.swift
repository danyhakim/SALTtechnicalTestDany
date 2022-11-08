//
//  LoginViewModel.swift
//  SALT Technical Test App
//
//  Created by Dany Elita on 08/11/22.
//  Copyright © 2022 Dany Hakim. All rights reserved.
//

import Foundation

class LoginViewModel{
    var uid:Int = -1
    var userData:User!
    private var network = Network()
    var error:String =  ""
    
    func checkLoginStatus(username:String,password:String, completion: @escaping (Bool) -> ()){
        self.network.getLoginAccess(username: username,password: password){ (token,error) in
            if token != "" {
                let user = token.components(separatedBy: "X")
                self.uid = Int(user[1])!
                completion(true)
            }
            else{
                self.error = error
                completion(false)
            }
        }
    
        
    }
    
    func getUserData(completion: @escaping(User)->()){
        self.network.getUserDetails(uid: uid){ (user) in
            self.userData = user
            completion(self.userData)
        }
    }
    
    
    
    
}
