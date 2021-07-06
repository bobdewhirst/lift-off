//
//  SpaceXDataSource.swift
//  Lift-Off
//
//  Created by Bobby Dev on 04/07/2021.
//

import Foundation

final class SpaceXDataSource {
    
    var launches: [Launch] = [Launch]()
   
    func loadData(from url: URL, completionHander: @escaping (Result<[Launch], Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    completionHander(.failure(error))
                }
                return
            }
            do {
                let decoder: JSONDecoder = JSONDecoder()
                self.launches = try decoder.decode([Launch].self, from: data)
                completionHander(.success(self.launches))
            } catch {
                completionHander(.failure(error))
            }
        }
        task.resume()
    }
}
