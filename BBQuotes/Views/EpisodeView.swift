//
//  EpisodeView.swift
//  BBQuotes
//
//  Created by Tarun Sharma on 08/02/26.
//

import SwiftUI

struct EpisodeView: View {
    let episode: Episode
    
    var body: some View {
        VStack (alignment: .leading) {
            
            // Episode title
            Text(episode.title)
                .font(.title)
                .padding(.top, 10)
            // season episode
            Text(episode.seasonEpisode)
            // image
            AsyncImage(url: episode.image) {
                image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 20))
                    
            } placeholder: {
                ProgressView()
            }
            // Info of episode
            Text(episode.synopsis)
                .minimumScaleFactor(0.5)
                .padding(.bottom)
            
            // Written by
            Text("Written By: \(episode.writtenBy)")
            // Directed by
            Text("Directed By: \(episode.directedBy)")
            // Aired on
            Text("Air Date: \(episode.airDate)")
                .padding(.bottom, 10)
        }
        .padding(.horizontal)
        .foregroundStyle(.white)
        .background(Color.black.opacity(0.6))
        .clipShape(.rect(cornerRadius: 20))
        .padding(.horizontal)
        
    }
}

#Preview {
    EpisodeView(episode: ViewModel().episode)
}
