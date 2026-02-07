//
//  Episode.swift
//  BBQuotes
//
//  Created by Tarun Sharma on 08/02/26.
//

import Foundation

struct Episode : Decodable {
    let episode: Int
    let title: String
    let image: URL
    let writtenBy : String
    let directedBy : String
    let airDate: String
    let synopsis: String
    
    var seasonEpisode : String {
        "Season \(episode / 100)  Episode \(episode % 100)"
    }
    
}
