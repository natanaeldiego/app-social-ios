//
//  UserViewModel.swift
//  App-Social
//
//  Created by Natanael Diego on 12/04/21.
//

import Foundation
import Combine


class UserViewModel: ObservableObject {
    
    private let kBaseURL = "https://jsonplaceholder.typicode.com"
    
    @Published
    private(set) var loading = false
    
    @Published
    private(set) var users = [User]() {
        didSet {
            loading = false
        }
    }
    
    private var usersCancellationToken: AnyCancellable?
    
    func newFetchUsers() {
        usersCancellationToken?.cancel()
        
        if let url = URL(string: "\(kBaseURL)/users") {
            let session = URLSession.shared

            let request = URLRequest(url: url)
            loading = true
            usersCancellationToken = session.dataTaskPublisher(for: request)
                .tryMap(session.map(_:))
                .decode(type: [User].self, decoder: JSONDecoder())
                .breakpointOnError()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: sinkError(_:)) { self.users = $0 }
        }
    }
    
}
