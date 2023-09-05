//
//  ViewStateModifier.swift
//  
//
//  Created by Abdhi P on 05/09/23.
//

import Combine
import SwiftUI

public struct ViewStateModifier<TheValue>: ViewModifier {
  
  var data: Published<ViewState<TheValue>>.Publisher
  var onLoading: ((Bool) -> Void)?
  var onSuccess: ((TheValue) -> Void)?
  var onFailed: ((Error) -> Void)?
  
  public func body(content: Content) -> some View {
    content
      .onAppear()
      .onReceive(data) { state in
        switch state.simplify() {
        case .loading:
          onLoading?(true)
        case .success(let value):
          onLoading?(false)
          onSuccess?(value)
        case .failed(let error):
          onLoading?(false)
          onFailed?(error)
        default:
          break
        }
      }
  }
}

extension View {
  public func viewState<TheValue>(
    _ data: Published<ViewState<TheValue>>.Publisher,
    onLoading: ((Bool) -> Void)? = nil,
    onSuccess: ((TheValue) -> Void)? = nil,
    onFailed: ((Error) -> Void)? = nil
  ) -> some View {
    modifier(ViewStateModifier(data: data, onLoading: onLoading, onSuccess: onSuccess, onFailed: onFailed))
  }
}
