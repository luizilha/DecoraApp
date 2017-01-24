//
//  Usuario.swift
//  Decora
//
//  Created by Luiz Ilha on 22/12/16.
//  Copyright © 2016 Luiz Ilha. All rights reserved.
//

import UIKit
import Alamofire


class Usuario: NSObject {    
    var token: String!
    var client: String!
    var uid: String!
    
    override public var description: String { return "TOKEN:: \(self.token) CLIENT:: \(self.client) UID:: \(self.uid)"}
    
    override init() {
        self.token = UserDefaults.standard.value(forKey: "user_token") as? String
        self.client = UserDefaults.standard.value(forKey: "user_client") as? String
        self.uid = UserDefaults.standard.value(forKey: "user_uid") as? String
    }
    
    func convertHeaderToUsuario(response: HTTPURLResponse) -> Usuario {
        let usuario = Usuario()
        usuario.token = response.allHeaderFields["access-token"] as! String
        usuario.client = response.allHeaderFields["client"] as! String
        usuario.uid = response.allHeaderFields["uid"] as! String
        return usuario
    }
    
    func saveDefault() {
        UserDefaults.standard.set(self.token, forKey: "user_token")
        UserDefaults.standard.set(self.client, forKey: "user_client")
        UserDefaults.standard.set(self.uid, forKey: "user_uid")
    }    
}
