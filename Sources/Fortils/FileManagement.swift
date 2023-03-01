//
//  FileManagement.swift
//  
//
//  Created by Abdhi P on 21/02/23.
//

import Foundation

/// Managing URL files from local and remote network.
public struct FileManagement {

  /// Get local file URL from remote, by validating previously downloaded file
  /// - Parameters:
  ///   - remoteUrl: A value that represents the URL from the remote network.
  ///   - completion: Perform get local file URL and error after validating remote URL
  public static func previewFile(remoteUrl: URL, completion: @escaping (URL?, Error?) -> Void) {
    let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    let fileName = remoteUrl.lastPathComponent
    let filePath = "\(documentPath)/\(fileName)"
    let isFileExist = FileManager.default.fileExists(atPath: filePath)
    if isFileExist {
      let fileUrl = Bundle(path: documentPath)?.url(forResource: fileName, withExtension: nil)
      completion(fileUrl, nil)
    } else {
      dowloadFile(withRequest: remoteUrl) { url, error in
        completion(url, error)
      }
    }
  }

  /// Downloading file from remote network.
  /// - Parameters:
  ///   - remoteUrl: A value that represents the URL from the remote network.
  ///   - customFileName: A value for a given custom file name
  ///   - completion: Perform get local file URL and error after downloading remote URL
  public static func dowloadFile(withRequest remoteUrl: URL, customFileName: String = "", completion: @escaping (URL?, Error?) -> Void) {
    URLSession.shared.downloadTask(with: remoteUrl) { tempFileUrl, response, error in
      let fileData = loadFileFromLocalPath(tempFileUrl)
      if let fileData = fileData, let response = response {
        do {
          let pathExtension = response.suggestedFilename?.split(separator: ".").last
          let fileName = customFileName.isEmpty ? response.suggestedFilename ?? "fileName.jpg" : customFileName.appending(".\(pathExtension ?? "")")
          let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
          let contentURL = documentDirectory
            .appendingPathComponent(fileName)
          try fileData.write(to: contentURL)
          completion(contentURL, nil)
        } catch {
          completion(nil, error)
          print("Error: \(error.localizedDescription)")
        }
      } else {
        completion(nil, error)
        print("Error: \(String(describing: error?.localizedDescription))")
      }
    }.resume()
  }

  /// Load local data file with URL
  /// - Parameters:
  ///   - fileUrl:A value that represents the URL to locate the local file.
  public static func loadFileFromLocalPath(_ fileUrl: URL?) -> Data? {
    guard let fileUrl = fileUrl else { return nil}
    return try? Data(contentsOf: fileUrl)
  }
}
