//
//  Video.swift
//  mod5Challenge
//
//  Created by Oliver on 27/10/2022.
//

import Foundation

struct Video: Decodable, Identifiable {
    var id: Int
    var title: String
    var url: String
}
