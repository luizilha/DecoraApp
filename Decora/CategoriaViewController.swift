//
//  CategoriaTableViewController.swift
//  Decora
//
//  Created by Luiz Ilha on 22/12/16.
//  Copyright © 2016 Luiz Ilha. All rights reserved.
//

import UIKit
import Alamofire

class CategoriaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var categorias = Array<Categoria>()
    @IBOutlet weak var tbCategoria: UITableView!
    private let categoriaUrl = "http://mobile-decorazon.rhcloud.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Categorias"
        Alamofire.request(self.categoriaUrl).responseJSON { (response) in
            self.categorias = Categoria.parseCategoria(data: response.data!)
            self.tbCategoria.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        
        return self.categorias.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoriaCell") as! CategoriaTableViewCell
        let new = categorias[indexPath.row]
        cell.lblNome.text = new.nome
        cell.lblDescricao.text = new.descricao
        
        let url = self.categoriaUrl + new.capaUrl
        Alamofire.request(url).responseData(completionHandler: { response in
            guard let data = response.result.value else { return }
            cell.imgCapa.image = UIImage(data: data)!
        })
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueItem", sender: self)
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if identifier == "segueItem" {
             
        }
    }
}
