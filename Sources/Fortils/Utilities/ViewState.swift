//
//  ViewState.swift
//  
//
//  Created by Abdhi P on 05/09/23.
//

import Foundation

public class ViewState<T> {
  public var value: T? {
    return (self as? Success<T>)?.data
  }
  
  public var error: Error? {
    return (self as? Failed)?.reason
  }
  
  public init() {}
  
  public class Initiate: ViewState {}
  
  public class Loading: ViewState {}
  
  public class Success<T>: ViewState {
    let data: T
    
    public init(data: T) {
      self.data = data
      super.init()
    }
  }
  
  public class Failed: ViewState {
    public let reason: Error
    
    public init(error: Error) {
      self.reason = error
      super.init()
    }
  }
}

public enum SimpleViewState<T> {
  case initiate
  case loading
  case failed(error: Error)
  case success(data: T)
  
  var value: T? {
    if case .success(let data) = self {
      return data
    }
    return nil
  }
}

extension ViewState {
  public func simplify() -> SimpleViewState<T> {
    switch self {
    case is ViewState<T>.Loading:
      return .loading
    case is ViewState<T>.Success<T>:
      return .success(data: self.value!)
    case let state where state is ViewState<T>.Failed:
      return .failed(error: self.error!)
    default:
      return .initiate
    }
  }
}
