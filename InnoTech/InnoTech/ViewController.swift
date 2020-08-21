//
//  ViewController.swift
//  InnoTech
//
//  Created by 梁雅軒 on 2020/8/21.
//  Copyright © 2020 梁雅軒. All rights reserved.
//

import UIKit
import BaseJson4
class ViewController: UIViewController {
    var arrData = [PhotoInfo]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PhotoCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PhotoCell")
        APIManager.share.loadData {[weak self] (infos) in
            if let infos = infos {
                self?.arrData = infos
                self!.tableView.reloadData()
            }
        }
    }
}

extension ViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.setInfo(info: arrData[indexPath.row]) {
//            tableView.reloadRows(at: [indexPath], with: .none)
//            tableView.beginUpdates()
//            tableView.endUpdates()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = arrData[indexPath.row]
        print(info.description)
    }
}

class PhotoInfo:BaseJson4 {
    var albumId:Int!
    var id:Int!
    var title:String!
    var url:String!
    var thumbnailUrl:String!
}
