//
//  CustomError.swift
//  
//
//  Created by Abdhi P on 05/09/23.
//

import Foundation

public enum ApiError: Error {
  case unknown
  case connectionError
  case invalidJSONError
  case middlewareError(code: Int, message: String?)
  case failedMappingError
  case noData
  
  public var localizedDescription: String {
    switch self {
    case .unknown:
      return "An error occurred. Please try again later."
    case .connectionError:
      return "Connection problem. Please check your internet connection."
    case .invalidJSONError:
      return "Service response in an unexpected format."
    case .middlewareError(_, let message):
      return message ?? ""
    case .failedMappingError:
      return "Failed to read server's response."
    case .noData:
      return "Data not found"
    }
  }
}

public enum DatabaseError: LocalizedError {
  case invalidInstance
  case requestFailed
  
  public var errorDescription: String? {
    switch self {
    case .invalidInstance:
      return "Database can't instance."
    case .requestFailed:
      return "Your request failed."
    }
  }
}
