//
//  ObservableObject+Utils.swift
//  App-Social
//
//  Created by Natanael Diego on 12/04/21.
//

import Combine

extension ObservableObject {
    
    internal func sinkError(_ completion: Subscribers.Completion<Error>) {
        switch completion {
            case .failure(let error): debugPrint(error)
            default: break
        }
    }
    
}
