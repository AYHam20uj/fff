//
//  remote.swift
//  final
//
//  Created by Ayham on 2021-11-29.
//

// The following 51 lines of code was added by courtesy of Garrit Schaap
import Foundation
import Combine

class Remote<ResultData>: ObservableObject {
    
    private var cancellableTask: AnyCancellable?
    
    @Published var isLoading = false
    @Published var data: ResultData?
    
    let url: URL
    let decode: (Data) throws -> ResultData
    
    init(url: URL, decode: @escaping (Data) throws -> ResultData) {
        self.url = url
        self.decode = decode
    }
    
    func fetch() {
        isLoading = true
        
        cancellableTask = URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .tryMap(decode)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                print(completion)
            }, receiveValue: { [weak self] data in
                self?.data = data
            })
    }
}

extension Remote where ResultData: Decodable {
    
    convenience init(url: URL) {
        self.init(url: url) { data in
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return try jsonDecoder.decode(ResultData.self, from: data)
        }
    }
}
