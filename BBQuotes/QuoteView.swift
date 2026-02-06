//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Tarun Sharma on 06/02/26.
//

import SwiftUI

struct QuoteView: View {
    let show: String
    let vm = ViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Image
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    // quote text
                    Text("  \" \(vm.quotes.quote) \"   ")
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.black.opacity(0.5))
                        .clipShape(.rect(cornerRadius: 25))
                        .padding(.horizontal)
                    
                    ZStack(alignment: .bottom) {
                        // character image
                        AsyncImage(url: vm.character.images[0]) {
                            Image in
                            Image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.8)
                
                        // character name
                        Text(vm.character.name)
                            .foregroundStyle(.white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                    }
                    .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.8)
                    .clipShape(.rect(cornerRadius: 50))
                    
                    // button
        
                }.frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    QuoteView(show: "Breaking Bad")
        .preferredColorScheme(.dark)
}
