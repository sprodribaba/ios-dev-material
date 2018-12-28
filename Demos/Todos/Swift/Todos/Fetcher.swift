//
//  Fetcher.swift
//  Todos
//
//  Created by Sasa Prodribaba on 25/12/2018.
//  Copyright © 2018 Sasa Prodribaba. All rights reserved.
//

import Foundation

class Fetcher {
    
    func fetchFromURL(url: URL, completion: @escaping (_ result: Data?) -> Void) {
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                completion(data)
            }
        })
        dataTask.resume()
    }
    
    func fetchWithResult(completion: @escaping (_ result: [Todo]) -> Void) {
        guard let url = URL(string: Constants.todosEndpoint) else { return }
        self.fetchFromURL(url: url) {
            result in
            let serializer = Serializer()
            if let result = result {
                let decodedObjects = serializer.serializeJSONObject(jsonData: result)
                completion(decodedObjects)
            }
        }
    }
    
}
