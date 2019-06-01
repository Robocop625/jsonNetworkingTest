//
//  ParsinInfo.swift
//  NetworkingTesting
//
//  Created by Robert Taylor-Anderson on 5/29/19.
//  Copyright © 2019 Robert Taylor-Anderson. All rights reserved.
//

import Foundation


struct HolidayResponse: Decodable{
    var response:[Holidays]
}

struct Holidays: Decodable{
    var holidays:[HolidayDetail]
}


struct HolidayDetail: Decodable {
    var name: String
    var date: DateInfo
}

struct DateInfo: Decodable {
    var iso: String
}
