//
//  StringExtension.swift
//  BBQuotes
//
//  Created by Tarun Sharma on 07/02/26.
//

import Foundation


extension String {
    func removeSpaces () -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpaces () -> String {
        self.lowercased().removeSpaces()
    }
}
