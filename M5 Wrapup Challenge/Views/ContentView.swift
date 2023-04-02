//
//  ContentView.swift
//  M5 Wrapup Challenge
//
//  Created by Quevin Bambasi on 4/1/23.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @EnvironmentObject var model:VideoViewModel
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchText.isEmpty ? model.videos : model.videos.filter({ video in
                    video.title.localizedStandardContains(searchText)
                })) { video in
                    NavigationLink(video.title, value: video.id)
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.grouped)
            .navigationTitle("All Videos")
            .navigationDestination(for: Int.self) { index in
                var url = URL(string: model.videos[index-1].url)
                
                VStack {
                    Text(model.videos[index-1].title)
                        .font(.largeTitle).bold()
                        .padding([.leading, .trailing])
                    VideoPlayer(player: AVPlayer(url: url!))
                        .aspectRatio(CGSize(width: 200, height: 100), contentMode: .fit)
                    Spacer()
                }
            }
        }
        .searchable(text: $searchText)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(VideoViewModel())
    }
}
