//
//  PostViewModel.swift
//  App-Social
//
//  Created by Natanael Diego on 12/04/21.
//

import Foundation
import Combine

class PostViewModel: ObservableObject {
    
    private let kBaseURL = "https://jsonplaceholder.typicode.com"
    
    @Published
    private(set) var loading = false
    
    @Published
    private(set) var detailUser = [DetailUser]() {
        didSet {
            loading = false
        }
    }
    private var usersCancellationToken: AnyCancellable?
    
    func detailUsers(idUser: Int) {
        usersCancellationToken?.cancel()
        
        if let url = URL(string: "\(kBaseURL)/users/\(idUser)/posts") {
            let session = URLSession.shared

            let request = URLRequest(url: url)
            loading = true
            print("DEBUG URL: \(url)")
            usersCancellationToken = session.dataTaskPublisher(for: request)
                .tryMap(session.map(_:))
                .decode(type: [DetailUser].self, decoder: JSONDecoder())
                .breakpointOnError()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: sinkError(_:)) { self.detailUser = $0 }
        }
    }
    
}
