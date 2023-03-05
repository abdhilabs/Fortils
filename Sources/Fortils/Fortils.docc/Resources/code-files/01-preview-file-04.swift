//
//  Created by Abdhi P on 04/03/23.
//

import Fortils
import SwiftUI
import QuickLook

struct PreviewFileView: View {
  @State var fileUrl: URL?

  var body: some View {
    Button("Preview File") {
      guard let remoteUrl = URL(string: "https://pbs.twimg.com/media/Eq5xtMLXcAE4EcP.jpg") else { return }
      FileManagement.previewFile(remoteUrl: remoteUrl) { fileUrl, error in
        self.fileUrl = fileUrl
      }
    }
    .quickLookPreview($fileUrl)
  }
}

struct PreviewFileView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewFileView()
  }
}
