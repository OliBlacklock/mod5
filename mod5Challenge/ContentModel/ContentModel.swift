//
//  ContentModel.swift
//  mod5Challenge
//
//  Created by Oliver on 27/10/2022.
//

import Foundation


class Model : ObservableObject {
    
    @Published var videos = [Video]()
    
    init() {
             getRemoteData()
        }

    func getRemoteData() {
            
            // String path
            let urlString = "https://oliblacklock.github.io/mod5Challenge/Data.json"
        
            // Create a url object
            let url = URL(string: urlString)
            
            guard url != nil else {
                // Couldn't create url
                return
            }
            
            // Create a URLRequest object
            let request = URLRequest(url: url!)
            
            // Get the session and kick off the task. The URLSession is a class that we use to fire off
            //requests and work with any response such as returned JSONs
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                
                // Check if there's an error
                guard error == nil else {
                    // There was an error
                    return
                }
                
                do {
                    // Create json decoder
                    let decoder = JSONDecoder()
                
                    // Decode
                    let videos = try decoder.decode([Video].self, from: data!)
                    
                    // Append parsed modules into modules property. We need to wrap it in the DispatchQueue method as getting data from the network may take a long time and must be handled by the main thread, rather than in the background.
        DispatchQueue.main.async {
                        self.videos = videos
                            }
                }
                catch {
                    // Couldn't parse json
                }
            }
            // Kick off data task
            dataTask.resume()
        }
}





