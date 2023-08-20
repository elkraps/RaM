//
//  DetailScreen.swift
//  RaM
//
//  Created by Vlad Dzirko on 19.08.2023.
//

import SwiftUI

struct DetailScreen: View {
    
    let characters: Character

    @ObservedObject var detailViewModel: CharacterDetailViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color(Resources.Colors.mainBackground)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    VStack {
                        AsyncImage(url: URL(string: characters.image)) {
                            phase in
                            switch phase {
                                
                            case .empty:
                                ProgressView()
                                    .frame(width: 148, height: 148)
                                    .background(.white)
                                    .cornerRadius(15)
                                    .padding(.top, 16)
                                
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 148, height: 148)
                                    .cornerRadius(15)
                                    .padding(.top, 16)
                                
                            case .failure:
                                Image(systemName: "photo")
                                    .imageScale(.large)
                                    .frame(width: 148, height: 148)
                                    .background(.white)
                                    .cornerRadius(15)
                                    .padding(.top, 16)
                            @unknown default:
                                fatalError()
                            }
                            
                        }
                        
                        Text(characters.name)
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                            .padding(.top, 24)
                        
                        Text(characters.status.rawValue)
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(characters.status.color)
                            .padding(.vertical, 2)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack {
                        Text("Info")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 24)
                            .padding(.leading, 24)
                        
                        VStack {
                            HStack {
                                Text("Species:")
                                    .font(.system(size: 16, weight: .light))
                                    .foregroundColor(Color(Resources.Colors.secondFontColor))
                                Spacer()
                                Text(characters.species.rawValue)
                                    .font(.system(size: 16, weight: .light))
                                    .foregroundColor(Color(Resources.Colors.mainFontColor))
                                
                                
                            }
                            .padding([.vertical, .horizontal], 16)
                            
                            HStack {
                                Text("Type:")
                                    .font(.system(size: 16, weight: .light))
                                    .foregroundColor(Color(Resources.Colors.secondFontColor))
                                Spacer()
                                Text(characters.type.isEmpty ? "loading..." : characters.type)
                                    .font(.system(size: 16, weight: .light))
                                    .foregroundColor(Color(Resources.Colors.mainFontColor))
                            }
                            .padding(.vertical, 4)
                            .padding(.horizontal, 16)
                            
                            HStack {
                                Text("Gender:")
                                    .font(.system(size: 16, weight: .light))
                                    .foregroundColor(Color(Resources.Colors.secondFontColor))
                                Spacer()
                                Text(characters.gender.rawValue)
                                    .font(.system(size: 16, weight: .light))
                                    .foregroundColor(Color(Resources.Colors.mainFontColor))
                            }
                            .padding([.vertical, .horizontal], 16)
                        }
                        
                        .background(Color(Resources.Colors.backgoundCells))
                        .cornerRadius(15)
                        .padding()
                        
                        VStack {
                            Text("Origin")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 24)
                                .padding(.leading, 24)
                            
                            HStack {
                                
                                Image(systemName: "baseball")
                                    .foregroundColor(.black)
                                    .frame(width: 64, height: 64)
                                    .background(.indigo)
                                    .cornerRadius(15)
                                    .padding(.all, 8)
                                
                                
                                VStack {
                                    Text(characters.origin.name)
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(Color(Resources.Colors.mainFontColor))
                                        
                                        .padding(.bottom, 4)
                                    Text(characters.location.name)
                                        .font(.system(size: 13, weight: .light))
                                        .foregroundColor(Color(Resources.Colors.greenFontColor))
                                        
                                }
                                
                                Spacer()
                            }
                            .background(Color(Resources.Colors.backgoundCells))
                            .cornerRadius(15)
                            .padding(20)
                            
                            
                            VStack {
                                
                                Text("Episodes")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .semibold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 24)
                                    .padding(.leading, 24)
                                
                                ForEach(detailViewModel.episodes, id: \.id) { episode in
                                    VStack(alignment: .leading, spacing: 16) {
                                        
                                        Text(episode.name)
                                            .foregroundColor(Color(Resources.Colors.mainFontColor))
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                        HStack {
                                            Text(episode.episode)
                                                .foregroundColor(Color(Resources.Colors.greenFontColor))
                                                .font(.system(size: 13, weight: .light))
                                            Spacer()
                                            Text(episode.air_date)
                                                .foregroundColor(Color(Resources.Colors.secondFontColor))
                                                .font(.system(size: 13, weight: .light))
                                        }
                                    }
                                    .padding([.vertical, .horizontal], 16)
                                    .background(Color(Resources.Colors.backgoundCells))
                                    .cornerRadius(15)
                                    .padding(20)
                                }
                            }
                        }
                    }
                }
            }
//            .navigationBarBackButtonHidden(true)
//            .toolbarRole(.editor)
            .task {
                detailViewModel.fetchEpisodes()
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Image(systemName: "baseball")
//                            .foregroundColor(.white)
//                            .padding(.all, 12)
//                    }
//                }
//            }
            
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(
            characters:
                Character(id: 1,
                          name: "Rick Sanchez",
                          status: .dead,
                          species: .alien,
                          type: "hunter",
                          gender: .genderless,
                          origin: Origin(name: "Earth", url: "aa"),
                          location: CurrentLocation(name: "Planet", url: ""),
                          image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                          episode: [],
                          url: "",
                          created: "2.2.2."),
            detailViewModel: CharacterDetailViewModel())
    }
}
