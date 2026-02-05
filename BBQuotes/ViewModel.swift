//
//  ViewModel.swift
//  BBQuotes
//
//  Created by Tarun Sharma on 05/02/26.
//

import Foundation

@Observable
@MainActor
class ViewModel {
    
    enum fetchStatus {
        case notStarted
        case fetching
        case success
        case failure(error: Error)
    }
    
    private(set) var status: fetchStatus = .notStarted
    private let fetcher = FetchService()
    
    var quotes: Quote
    var character: Char
    
    init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let quoteUrl = Bundle.main.url(forResource: "samplequote", withExtension: "json")!
        let quoteData = try! Data(contentsOf: quoteUrl)
        quotes = try! decoder.decode(Quote.self, from: quoteData)
        
        let charUrl = Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!
        let charData = try! Data(contentsOf: charUrl)
        character = try! decoder.decode(Char.self, from: charData)
        
    }
    
    func getData(from show: String) async {
        status = .fetching
        
        do {
            quotes = try await fetcher.fetchQuote(from: show)
            character = try await fetcher.fetchCharacter(quotes.character)
            character.death = try await fetcher.fetchDeath(for: character.name)
            status = .success
        } catch {
            status = .failure(error: error)
        }
        
    }

    
}
