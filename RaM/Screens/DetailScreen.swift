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
                    
                    AboutView(url: characters.image, name: characters.name, status: characters.status.rawValue, color: characters.status.color)
                    
                    VStack {
                        RowName(name: "Info")
                        
                        VStack{
                            CharacterRow(typeInfo: "Species:", generalInfo: characters.species.rawValue)
                            CharacterRow(typeInfo: "Type:", generalInfo: characters.type.isEmpty ? "Loading..." : characters.type)
                            CharacterRow(typeInfo: "Gender:", generalInfo: characters.gender.rawValue)
                            
                        }
                        
                        .background(Color(Resources.Colors.backgoundCells))
                        .cornerRadius(15)
                        .padding(.horizontal, 20)
                        
                        VStack {
                            RowName(name: "Origin")
                            
                            OriginView(image: Image("planet"), origin: characters.origin.name, location: characters.location.name)
                            
                        }
                        
                        VStack {
                            RowName(name: "Episodes")
                            
                            ForEach(detailViewModel.episodes, id: \.id) { episode in
                                EpisodeRowView(episodeName: episode.name, episodeNumber: episode.episode, episodeDate: episode.air_date)
                            }
                        }
                    }
                }
            }
        }
        .task {
            detailViewModel.fetchEpisodeForOneCharacter(character: characters)
        
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(
            characters:
                Character(id: 1,
                          name: "Rick Sanchez",
                          status: .unknown,
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

struct AboutView: View {
    
    let url: String
    let name: String
    let status: String
    let color: Color
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: url)) {
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
            
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .bold))
                .padding(.top, 24)
            
            Text(status)
                .font(.system(size: 16, weight: .light))
                .foregroundColor(color)
                .padding(.vertical, 2)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct OriginView: View {
    let image: Image
    let origin: String
    let location: String
    
    var body: some View {
        HStack {
            
            image
                .frame(width: 64, height: 64)
                .background(Color(Resources.Colors.planetCell))
                .cornerRadius(15)
                .padding(.all, 8)
            
            
            VStack(alignment: .leading) {
                Text(origin)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(Resources.Colors.mainFontColor))
                
                    .padding(.bottom, 4)
                Text(location)
                    .font(.system(size: 13, weight: .light))
                    .foregroundColor(Color(Resources.Colors.greenFontColor))
                
            }
            
            Spacer()
        }
        .background(Color(Resources.Colors.backgoundCells))
        .cornerRadius(15)
        .padding(.horizontal, 20)
    }
}

struct EpisodeRowView: View {
    
    let episodeName: String
    let episodeNumber: String
    let episodeDate: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(episodeName)
                .foregroundColor(Color(Resources.Colors.mainFontColor))
                .font(.system(size: 17, weight: .semibold))
            
            HStack {
                Text(episodeNumber)
                    .foregroundColor(Color(Resources.Colors.greenFontColor))
                    .font(.system(size: 13, weight: .light))
                Spacer()
                Text(episodeDate)
                    .foregroundColor(Color(Resources.Colors.secondFontColor))
                    .font(.system(size: 13, weight: .light))
            }
        }
        .padding([.vertical, .horizontal], 16)
        .background(Color(Resources.Colors.backgoundCells))
        .cornerRadius(15)
        .padding(.horizontal, 20)
        .padding(.vertical, 4)
    }
}

struct CharacterRow: View {
    
    let typeInfo: String
    let generalInfo: String
    
    var body: some View {
        HStack {
            Text(typeInfo)
                .font(.system(size: 16, weight: .light))
                .foregroundColor(Color(Resources.Colors.secondFontColor))
            Spacer()
            Text(generalInfo)
                .font(.system(size: 16, weight: .light))
                .foregroundColor(Color(Resources.Colors.mainFontColor))
            
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

struct RowName: View {
    let name: String
    
    var body: some View {
        Text(name)
            .foregroundColor(.white)
            .font(.system(size: 17, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 24)
            .padding(.leading, 24)
    }
}
