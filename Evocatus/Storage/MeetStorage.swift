//
//  MeetStorage.swift
//  Evocatus
//
//  Created by Boris Sobolev on 02.10.2021.
//

import Foundation

class MeetsStorage {
    
    let allMeets: [EventModel]
    
    init() {
        
        allMeets = [EventModel(name: "Пивопятница", type: "Type event", logo: "bar1", location: "Moscow"),
                    EventModel(name: "Го по кофе", type: "Type event", logo: "bar2", location: "Moscow"),
                    EventModel(name: "Хочу пиццу", type: "Type event", logo: "bar3", location: "Moscow"),
                    EventModel(name: "KFC рулит", type: "Type event", logo: "bar1", location: "Moscow"),
                    
        ]
    }
}
