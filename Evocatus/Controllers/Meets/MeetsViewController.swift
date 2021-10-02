//
//  MeetsViewController.swift
//  Evocatus
//
//  Created by Boris Sobolev on 02.10.2021.
//

import UIKit
//import Alamofire
//import SwiftyJSON

class PlacesViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var array  = [String]()
    let url = "https://jsonplaceholder.typicode.com/comments"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        tableView.register(UINib(nibName: "PlacesTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "PlacesTableViewCellReuseIndentifier")
        
        //getZapros(url: url)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        getZapros(url: url)
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    @objc private func reloadPlacesList(notification: NSNotification)
       {
           tableView.reloadData()
           self.view.setNeedsDisplay()
       }
    
    @objc func loadList(notification: NSNotification){
        print("reloadList")
        tableView.reloadData()
        //tabBar.items![1].badgeValue = String(Storage.allUsers[Storage.userIdActiveSession].favGroups.count)
    }
    
    
    func getZapros(url: String) {
//        AF.request(url).responseJSON {response in
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                //print(json[0], json[1])
//                self.array.append("\(json[0]["name"])")
//                print(json["answer"])
//            case .failure(let error):
//                print(error)
//            }
//
//        }
    }
}



extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Storage.allPlaces.count
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: MeetsTableViewCell.identifier, for: indexPath) as! MeetsTableViewCell
        cell.configure(placeName: array[indexPath.row], placeLogo: array[indexPath.row])
        return cell
    }
}
