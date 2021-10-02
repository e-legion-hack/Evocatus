//
//  MeetsViewController.swift
//  Evocatus
//
//  Created by Boris Sobolev on 02.10.2021.
//

import UIKit
//import Alamofire
//import SwiftyJSON

class MeetViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var array  = [String]()
    let url = "https://jsonplaceholder.typicode.com/comments"
    
    let data = [["0,0", "0,1", "0,2"], ["1,0", "1,1", "1,2"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        tableView.register(UINib(nibName: "MeetsTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "MeetsTableViewCellReuseIndentifier")
        
        //getZapros(url: url)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        getZapros(url: url)
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.separatorColor = .clear
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



extension MeetViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Мои заявки"
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        Storage.allMeets.count
        data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: MeetsTableViewCell.identifier, for: indexPath) as! MeetsTableViewCell
        cell.configure(placeName: Storage.allMeets[indexPath.row].name, placeLogo: Storage.allMeets[indexPath.row].logo, location: Storage.allMeets[indexPath.row].location, isMy: Storage.allMeets[indexPath.row].isMyEvent)
        return cell
    }
}
