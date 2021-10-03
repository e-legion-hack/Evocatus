//
//  MeetsViewController.swift
//  Evocatus
//
//  Created by Boris Sobolev on 02.10.2021.
//

import UIKit
import SnapKit

class MeetViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var array  = [String]()
    let url = "https://jsonplaceholder.typicode.com/comments"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = UIColor(hex: "F5F5FA")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .clear

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(loadList),
            name: NSNotification.Name(rawValue: "load"), object: nil
        )

        tableView.register(MeetsTableViewCell.self, forCellReuseIdentifier: MeetsTableViewCell.identifier)

        refreshData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        tableView.reloadData()
    }
    
    @objc private func reloadPlacesList(notification: NSNotification) {
        tableView.reloadData()
        self.view.setNeedsDisplay()
    }
    
    @objc func loadList(notification: NSNotification){
        print("reloadList")
        tableView.reloadData()
        //tabBar.items![1].badgeValue = String(Storage.allUsers[Storage.userIdActiveSession].favGroups.count)
    }

    func refreshData() {
        URLSession.init(
            configuration: .default
        ).dataTask(
            with: URL(string: "https://api.legion-hack.ru/employee/7/e-tinder/")!
        ) { data, responce, error in

            if let error = error {
                assertionFailure()
                return
            }

            if let data = data,
               let result = try? JSONDecoder().decode(TopLevel.self, from: data) {
                self.myEvents = result.message.employee
                self.events = result.message.other
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }

        }.resume()
    }

    private var myEvents: [Event] = []
    private var events: [Event] = []
    
    
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

    @IBAction func filtersButtonAction(_ sender: Any) {
        let vc = FiltersViewController()
        present(vc, animated: true, completion: nil)
    }

    @IBAction func newEventsButtonAction(_ sender: Any) {
        let vc = NewEvents()
        present(vc, animated: true, completion: nil)
    }
}



extension MeetViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Мои заявки"
        } else if section == 1 {
            return "Сегодня"
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return MeetsStorage.myMeets.count
        } else if section == 1 {
            return MeetsStorage.allMeets.count
        } else {
            return 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(
            withIdentifier: MeetsTableViewCell.identifier,
            for: indexPath
        ) as! MeetsTableViewCell

        if indexPath.section == 0 {
            cell.configure(
                placeName: MeetsStorage.myMeets[indexPath.row].name,
                placeLogoUrl:  MeetsStorage.myMeets[indexPath.row].logo,
                location: "Бар «Небар»",
                time: "Пт, 04.10 19:00",
                isChecked: false
            )
        } else if indexPath.section == 1 {
            cell.configure(
                placeName: MeetsStorage.allMeets[indexPath.row].name,
                placeLogoUrl:  MeetsStorage.allMeets[indexPath.row].logo,
                location: "Столовка",
                time: "12:00",
                isChecked: true
            )
        }

        return cell
    }
}
