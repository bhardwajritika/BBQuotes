//
//  Char.swift
//  BBQuotes
//
//  Created by Tarun Sharma on 03/02/26.
//

import Foundation

struct Char: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let status: String
    let portrayedBy: String
    
    var death: Death? // Initially set to nil
}
