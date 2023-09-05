//
//  Spacer.swift
//  
//
//  Created by Abdhi P on 05/09/23.
//

import SwiftUI

public struct VerticalSpacer: View {
  public let height: CGFloat
  
  public var body: some View {
    Spacer()
      .frame(height: height)
  }
}

public struct HorizontalSpacer: View {
  public let width: CGFloat
  
  public var body: some View {
    Spacer()
      .frame(width: width)
  }
}
