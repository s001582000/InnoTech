//
//  ViewController.swift
//  InnoTech
//
//  Created by 梁雅軒 on 2020/8/21.
//  Copyright © 2020 梁雅軒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arrData = [PhotoInfo]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PhotoCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PhotoCell")
    }
}

extension ViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        return cell
    }
}

class PhotoInfo {
    var albumId:String!
    var id:String!
    var title:String!
    var url:String!
    var thumbnailUrl:String!
}
