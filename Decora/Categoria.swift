//
//  Categoria.swift
//  Decora
//
//  Created by Luiz Ilha on 22/12/16.
//  Copyright © 2016 Luiz Ilha. All rights reserved.
//

import UIKit
import Alamofire

class Categoria: NSObject {
    var idCategoria: Int!
    var nome: String!
    var descricao: String!
    var capaUrl: String!
    
    override init() {
        nome = ""; descricao = ""; capaUrl = ""
    }
    
    static func parseCategoria(data: Data) -> Array<Categoria> {
        var categorias = Array<Categoria>()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSArray
            for i in json {
                if let new = i as? [String:AnyObject] {
                    categorias.append(Categoria.convertJsonToCategoria(json: new))
                }
            }            
        } catch {
            print ("deu ruim")
        }
        return categorias
    }
    
    static private func convertJsonToCategoria(json: [String:AnyObject]) -> Categoria {
        let categoria = Categoria()
        categoria.idCategoria = json["id_categoria"] as! Int
        categoria.nome = json["nome"] as! String
        categoria.descricao = json["descricao"] as! String
        categoria.capaUrl = json["capa_url"] as! String
        return categoria
    }
    
    
}
