//
//  ItemViewController.swift
//  Decora
//
//  Created by Luiz Ilha on 05/01/17.
//  Copyright © 2017 Luiz Ilha. All rights reserved.
//

import UIKit
import Alamofire

class ItemViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let url = "http://mobile-decorazon.rhcloud.com"
    var itens = Array<Item>()
    var categoria: Categoria!
    @IBOutlet weak var collection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(self.url + "/itens").responseJSON { (response) in
            self.itens = Item.parseItem(data: response.data!)
            self.collection.reloadData()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itens.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemCollectionViewCell
        let new = itens[indexPath.row]
        cell.layer.cornerRadius = 6
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.clear.cgColor        
        cell.layer.masksToBounds = true
        cell.lblNome.text = new.nome
        cell.lblprecoReposicao.text = String(format: "%.2f", new.precoReposicao)
        cell.lblpreco.text =  String(format: "%.2f", new.preco)
        let url = self.url + new.urlFoto
        Alamofire.request(url).responseData(completionHandler: { response in
            guard let data = response.result.value else { return }
            cell.imgFoto.image = UIImage(data: data)!
        })
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
