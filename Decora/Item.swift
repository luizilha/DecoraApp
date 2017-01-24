//
//  Item.swift
//  Decora
//
//  Created by Luiz Ilha on 05/01/17.
//  Copyright © 2017 Luiz Ilha. All rights reserved.
//

import UIKit

class Item: NSObject {
    var nome: String!
    var urlFoto: String!
    var daCategoria: String!
    var preco: Float!
    var precoReposicao: Float!
    var quantidade: Int!
    
    override init() {
        self.nome = ""; self.urlFoto = ""; self.daCategoria = ""
    }
    
    static func parseItem(data: Data) -> Array<Item> {
        var itens = Array<Item>()
        do {
            let json = try  JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            for i in json {
                if let jsonItem = i as? [String:AnyObject] {
                    itens.append(Item.convertJsonToItem(json: jsonItem))
                }
            }
        } catch {
            print ("erro")
        }
        return itens
    }
    
    static private func convertJsonToItem(json: [String:AnyObject]) -> Item {
        let item = Item()
        item.nome = json["nome"] as! String
        item.preco = json["preco"] as! Float
        item.precoReposicao = json["preco_reposicao"] as! Float
        item.daCategoria = json["da_categoria"] as! String
        item.urlFoto = json["foto_url"] as! String
        return item
    }
    
}
