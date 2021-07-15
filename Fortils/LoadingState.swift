//
//  LoadingState.swift
//
//  Created by Abdhi on 26/06/21.
//

import Foundation

public enum ResultState<T, S> {
    case loading
    case success(T)
    case failure(S)
}


