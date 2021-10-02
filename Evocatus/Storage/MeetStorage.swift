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
        
        allMeets = [EventModel(name: "Name event", type: "Type event", logo: "bar1", location: "Moscow"),
                    EventModel(name: "Name event", type: "Type event", logo: "bar2", location: "Moscow"),
                    EventModel(name: "Name event", type: "Type event", logo: "bar3", location: "Moscow"),
                    EventModel(name: "Name event", type: "Type event", logo: "bar1", location: "Moscow"),
                    
        ]
    }
}
