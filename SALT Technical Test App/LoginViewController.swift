//
//  LoginViewController.swift
//  SALT Technical Test App
//
//  Created by Dany Elita on 08/11/22.
//  Copyright © 2022 Dany Hakim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginViewModel = LoginViewModel()
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if usernameTextfield.text == "" || passwordTextfield.text == "" {
            //give empty username/password alert
            // create the alert
            let alert = UIAlertController(title: "Error", message: "Please fill Username or/and Password", preferredStyle: UIAlertController.Style.alert)

                                 // add an action (button)
                                 alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                                 // show the alert
                                 self.present(alert, animated: true, completion: nil)
        }
        else{
        loginViewModel = LoginViewModel()
            loginViewModel.checkLoginStatus(username: usernameTextfield.text!, password: passwordTextfield.text!) { result in
                DispatchQueue.main.async {
                              if result == true{
                                self.loginViewModel.getUserData(){ data in
                                    
                                    DispatchQueue.main.async {
                                        //go to next page
                                        self.loginViewModel.userData = data
                                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                        guard let vc = storyboard.instantiateViewController(withIdentifier: "homepage") as? ViewController else{return}
                                        vc.loginViewModel = self.loginViewModel
                                        self.show(vc, sender: self)
                                    }
                                    
                                }
                              
                                                             
                                                       }
                                                       else{
                                                           //show error
                                                         
                                  let alert = UIAlertController(title: "Error", message: self.loginViewModel.error, preferredStyle: UIAlertController.Style.alert)

                                                                 // add an action (button)
                                                                 alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                                                                 // show the alert
                                                                 self.present(alert, animated: true, completion: nil)
                                                       }
                          }
                
                
            }
    
          
            
            
            
            
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
