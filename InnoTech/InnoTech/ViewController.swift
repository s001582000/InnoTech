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
    var arrShowData = [PhotoInfo]()
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PhotoCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PhotoCell")
        APIManager.share.loadData {[weak self] (infos) in
            if let infos = infos {
                self?.arrData = infos
                self?.filterData()
            }
        }
    }
    
    func filterData(_ searchText:String? = nil) {
        if let searchText = searchText {
            arrShowData = arrData.filter { (info) -> Bool in
                return info.title.contains(searchText)
            }
        }else{
            arrShowData = arrData
        }
        
        tableView.reloadData()
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData(searchText.count > 0 ? searchText : nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension ViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrShowData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.setInfo(info: arrShowData[indexPath.row]) {
//            tableView.reloadData()
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
//            self.tableView.reloadRows(at: [indexPath], with: .none)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = arrShowData[indexPath.row]
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
