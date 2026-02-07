//
//  CharacterView.swift
//  BBQuotes
//
//  Created by Tarun Sharma on 07/02/26.
//

import SwiftUI

struct CharacterView: View {
    let character: Char
    let show: String
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack(alignment: .top) {
                // Image
                Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .scaledToFit( )
                
                ScrollView {
                    // Character Image
                    AsyncImage(url: character.images[0]) {
                        image in
                        image
                            .resizable()
                            .scaledToFill()
                            
                    } placeholder: {
                        ProgressView()
                    }
                    
                    .frame(width: geo.size.width / 1.2, height: geo.size.height / 1.7)
                    .clipShape(.rect(cornerRadius: 25))
                    .padding(.top, 60)
                    
                    VStack (alignment: .leading) {
                        // Character Name
                        Text(character.name)
                            .font(.largeTitle)
                        // PorterateBy
                        Text("Portrayed By: \(character.portrayedBy)")
                            .font(.subheadline)
                        
                        Divider()
                        
                        // Character Info
                        Text(character.name + " Character Info")
                            .font(.title2)
                        // Birthday
                        Text("Birthday: \(character.birthday)")
                        
                        Divider()
                        
                        // Occupations
                        Text("Occupations: ")
                            
                        ForEach(character.occupations, id: \.self) {
                            occupation in
                            Text("• \(occupation)")
                                .font(.subheadline)
                        }
                        Divider()
                        
                        // Alias
                        Text("Nicknames: ")
                        
                        if character.aliases.count > 0 {
                            ForEach(character.aliases, id: \.self) {
                                alias in
                                Text("• \(alias)")
                                    .font(.subheadline)
                            }
                        } else {
                            Text("None")
                                .font(.subheadline)
                        }
                        //Death
                        
                        DisclosureGroup("Status : Spoiler alert! ") {
                            VStack (alignment: .leading) {
                                // status
                                Text(character.status)
                                
                                if let death = character.death {
                                    // image
                                    AsyncImage(url: death.image) {
                                        Image in
                                        Image
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(.rect(cornerRadius: 25))
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    // how
                                    Text("How: \(death.details)")
                                        .padding(.bottom, 8)
                                    
                                    // last words
                                    Text("Last words: \(death.lastWords)")
                                    
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .tint(.primary)
                        
                        
                    }
                    .frame(width: geo.size.width / 1.25, alignment: .leading)
                    .padding(50)
                }
                .scrollIndicators(.hidden)
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    CharacterView(character: ViewModel().character, show: "Breaking Bad")
        .preferredColorScheme(.dark)
}
