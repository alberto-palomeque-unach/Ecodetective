//
//  SFSafariViewWrapper.swift
//  ecodetective
//
//  Created by Alberto Palomeque on 07/03/24.
//

import SwiftUI
import SafariServices

struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}

#Preview {
    SFSafariViewWrapper(url: URL(string: "https://google.com")!)
}
