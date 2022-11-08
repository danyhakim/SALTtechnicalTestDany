//
//  ViewController.swift
//  SALT Technical Test App
//
//  Created by Dany Elita on 08/11/22.
//  Copyright © 2022 Dany Hakim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var loginViewModel:LoginViewModel!
    @IBOutlet weak var firstNameTextfield: UILabel!
    @IBOutlet weak var lastNameTextfield: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(loginViewModel.userData.data.firstName)
        // Do any additional setup after loading the view
        loadTheUserDetails()
    }


    
    func loadTheUserDetails(){
        let url = URL(string: loginViewModel.userData.data.avatar)
        let data = try? Data(contentsOf: url!)
        userImage.image = UIImage(data: data!)
        firstNameTextfield!.text = loginViewModel.userData.data.firstName
        lastNameTextfield!.text = loginViewModel.userData.data.lastName
    }

}

