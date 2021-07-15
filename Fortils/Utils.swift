//
//  Utils.swift
//
//  Created by Abdhi on 20/06/21.
//

import Foundation

public class Utils {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
}
