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
        
        allMeets = [EventModel(name: "Пивопятница", type: "Type event", logo: "bar1", location: "Бар Небар", isMyEvent: true),
                    EventModel(name: "Го по кофе", type: "Type event", logo: "bar2", location: "Шоколадница", isMyEvent: false),
                    EventModel(name: "Хочу пиццу", type: "Type event", logo: "bar3", location: "Бургер кинг", isMyEvent: false),
                    EventModel(name: "Темное или светлое?", type: "Type event", logo: "bar1", location: "Магазин Беру выходной", isMyEvent: false),
                    
        ]
    }
}
