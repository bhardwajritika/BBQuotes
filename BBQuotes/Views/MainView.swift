//
//  MainView.swift
//  BBQuotes
//
//  Created by Tarun Sharma on 06/02/26.
//

import SwiftUI

struct MainView: View {
    let show: String
    let vm = ViewModel()
    @State var characterInfo = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Image
                Image(show.removeCaseAndSpaces())
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    VStack {
                        Spacer(minLength: 60)
                        
                        switch vm.status {
                        case .notStarted:
                            EmptyView()
                        case .fetching:
                            ProgressView()
                        case .successQuote:
                            Text("  \" \(vm.quotes.quote) \"   ")
                                .minimumScaleFactor(0.5)
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
                            .onTapGesture {
                                characterInfo.toggle()
                            }
                            .sheet(isPresented: $characterInfo) {
                                CharacterView(character: vm.character, show: show)
                            }
                            
                        case .successEpisode:
                            EpisodeView(episode: vm.episode)
                            
                        case .failure(let error):
                            Text(error.localizedDescription)
                        }
                        
                        Spacer(minLength: 20)
                    }
                    // button
                    HStack {
                        Button {
                            Task {
                                await vm.getQuoteData(from: show)
                            }
                        } label: {
                            Text("Get Random Quotes")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("\(show.removeSpaces())"+"Button"))
                                .shadow(color: (Color("\(show.removeSpaces())"+"Shadow")), radius: 5)
                                .clipShape(.rect(cornerRadius: 8))
                        }
                        
                        Spacer()
                        
                        Button {
                            Task {
                                await vm.getEpisodeData(from: show)
                            }
                        } label: {
                            Text("Get Random Episode")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("\(show.removeSpaces())"+"Button"))
                                .shadow(color: (Color("\(show.removeSpaces())"+"Shadow")), radius: 5)
                                .clipShape(.rect(cornerRadius: 8))
                        }
                    }
                    .padding(.horizontal,30)
                    
                    Spacer(minLength: 95)
                }.frame(width: geo.size.width, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    MainView(show: Constants.bbName)
        .preferredColorScheme(.dark)
}
