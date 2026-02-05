//
//  FetchService.swift
//  BBQuotes
//
//  Created by Tarun Sharma on 05/02/26.
//

import Foundation

struct FetchService {
    
    enum FetchError: Error {
        case invalidResponse
    }
    
    let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    
    
    func fetchQuote(from show: String) async throws -> Quote {
        // https://breaking-bad-api-six.vercel.app/api/quotes/random
        // create fetch URL
        let quoteURL = baseURL.appending(path: "quotes/random")
        let fetchURL = quoteURL.appending(queryItems: [URLQueryItem(name: "production", value: show)])
        
        print(fetchURL)
        
        // Fetch Data
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        // Handle Response
        guard let response  = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.invalidResponse
            }
        
        // Decode Data
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        
        // Return Data
        return quote
        
        
    }
    
    
    func fetchCharacter(_ name: String) async throws -> Char {
        // create fetrch URL
        let characterURL = baseURL.appending(path: "characters")
        let fetchURL = characterURL.appending(queryItems: [URLQueryItem(name: "name", value: name)])
        
        print(fetchURL)
        
        // fetch data
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        // Handle response
        guard let response  = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.invalidResponse
        }
        
        // Decode response
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let characters = try decoder.decode([Char].self, from: data)
        
        // return data
        return characters[0]
        
    }
    
    
    func fetchDeath(for character: String) async throws -> Death? {
        // build fetch URL
        let deathURL = baseURL.appending(path: "deaths")
        
        // fetch data
        let (data, response) = try await URLSession.shared.data(from: deathURL)
        
        // Handle response
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let deaths = try decoder.decode([Death].self, from: data)
        
        // find the character in the death array
        for death in deaths {
            if death.character == character {
                return death
            }
        }
        return nil
        
    }
}
