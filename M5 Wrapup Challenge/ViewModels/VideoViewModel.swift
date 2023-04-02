//
//  VideoViewModel.swift
//  M5 Wrapup Challenge
//
//  Created by Quevin Bambasi on 4/2/23.
//

import Foundation

class VideoViewModel: ObservableObject {
    // MARK: - Properties
    @Published var videos = [VideoModel]()
    
    init() {
        getRemoteData()
    }
    
    // MARK: - Methods
    func getRemoteData() {
        let url = URL(string: "https://codewithchris.github.io/Module5Challenge/Data.json")
        
        if let url = url {
            let request = URLRequest(url: url)
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    print("ERROR: \(error!)")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let videos = try decoder.decode([VideoModel].self, from: data!)
                    
                    self.videos = videos
                } catch {
                    print("ERROR: \(error)")
                }
            }
            
            dataTask.resume()
        }
    }
}
