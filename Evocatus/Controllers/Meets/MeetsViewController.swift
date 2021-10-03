//
//  MeetsViewController.swift
//  Evocatus
//
//  Created by Boris Sobolev on 02.10.2021.
//

import UIKit

class MeetViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private var myEvents: [Event] = []
    private var events: [Event] = []

    private var categoryFilter: FilterItem.Kind?
    private var dateFilter: DateSelectorItem.Kind?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(hex: "F5F5FA")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .clear
        tableView.register(MeetsTableViewCell.self, forCellReuseIdentifier: MeetsTableViewCell.identifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        refreshData()
    }

    func refreshData() {
        APIService.requestEvents { [weak self] result in
            guard let self = self else { return }
            if case let .success(message) = result {
                self.events = message.other
                self.myEvents = message.employee
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                assertionFailure()
            }
        }
    }

    @IBAction func filtersButtonAction(_ sender: Any) {
        let vc = FiltersViewController { [weak self] categoryFilter, dateFilter in
            if let self = self {
                self.categoryFilter = categoryFilter
                self.dateFilter = dateFilter
            }
        }
        present(vc, animated: true, completion: nil)
    }

    @IBAction func newEventsButtonAction(_ sender: Any) {
        let vc = NewEvents()
        present(vc, animated: true, completion: nil)
    }

    lazy var filter: (Event) -> Bool = { event in
        var isIncluded = true
        if let categoryFilter = self.categoryFilter {
            isIncluded = categoryFilter == event.category
        }
        // todo datefilter
        return isIncluded
    }
}

extension MeetViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int { 2 }

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
            return myEvents.count
        } else if section == 1 {
            return events
                .filter(filter)
                .count
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
                event: myEvents[indexPath.row],
                isChecked: false
            )
        } else if indexPath.section == 1 {
            cell.configure(
                event: events[indexPath.row],
                isChecked: true
            )
        }

        return cell
    }
}
