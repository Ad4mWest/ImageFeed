
//  SingleImageViewController.swift
//  ImageFeed
//  Created by Adam West on 10.06.23.

import UIKit

final class SingleImageViewController: UIViewController {

    var image: UIImage! {
        didSet {
            guard isViewLoaded else { return }
            imageView.image = image
        }
    }
    
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func didTapBackButton() {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
}
