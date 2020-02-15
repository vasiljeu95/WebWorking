//
//  ImageDataViewController.swift
//  WebWorking
//
//  Created by Stepan Vasilyeu on 2/15/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class ImageDataViewController: UIViewController {

    private let imadeDataURL = "https://images.unsplash.com/photo-1503435980610-a51f3ddfee50?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3034&q=80"
    
    @IBOutlet var imageDataView: UIImageView!
    @IBOutlet var activityImageIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityImageIndicator.startAnimating()
        activityImageIndicator.hidesWhenStopped = true
        fetchInameData()
    }
    
    // MARK: - Download Image SESSION
    private func fetchInameData() {
        guard let url = URL(string: imadeDataURL) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.imageDataView.image = image
                    self.activityImageIndicator.stopAnimating()
                }
            }
        }.resume()
    }

}
