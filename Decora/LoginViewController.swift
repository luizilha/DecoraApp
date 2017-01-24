//
//  ViewController.swift
//  Decora
//
//  Created by Luiz Ilha on 21/12/16.
//  Copyright © 2016 Luiz Ilha. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!    
    let user: Usuario = Usuario()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let user = Usuario()        
        if user.token != nil {
            self.performSegue(withIdentifier: "segueLogin", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btEntrar(_ sender: Any) {
        let loginUrl = "http://mobile-decorazon.rhcloud.com/auth/sign_in"
        let parameters = [
            "email": txtEmail.text!,
            "password": txtPassword.text!
        ]
        Alamofire.request(loginUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                let usuario = Usuario().convertHeaderToUsuario(response: response.response!)
                usuario.saveDefault()
                self.performSegue(withIdentifier: "segueLogin", sender: self)
            } else {
                print ("LOGIN INVALIDO")
            }
        }        
    }

}

