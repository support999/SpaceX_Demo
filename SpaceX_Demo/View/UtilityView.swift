//
//  UtilityView.swift
//  SpaceX_Demo
//
//  Created by Amit Saxena on 30/01/21.
//

import Foundation
import SwiftUI

//*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++
//Mark:- ActivityIndicator
//*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++
struct ActivityIndicator: UIViewRepresentable {
    @Binding var animating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: style)
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        animating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

//*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++
//Mark:- Image Setup
//*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++*******+++++
struct RemoteImage: View {
    
    private enum LoadState {
        case loading, success, failure
    }
    
    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading
        
        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }
            
            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }
                
                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }
    
    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image
    
    var body: some View {
        selectImage()
            
            .resizable()
            .scaledToFill()
            .frame(width: CGFloat(SpaceXApiConstants.imgWidth), height: CGFloat(SpaceXApiConstants.imgHeight))
            .cornerRadius(10)
            .shadow(radius: 3)
    }
    
    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }
    
    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}
