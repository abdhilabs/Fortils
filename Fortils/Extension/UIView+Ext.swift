//
//  UIView+Ext.swift
//
//  Created by Abdhi on 02/07/21.
//

import UIKit

public extension UIView {
    
    public func addSubviews(_ views: UIView...) {
      for view in views {
        addSubview(view)
      }
    }
}
