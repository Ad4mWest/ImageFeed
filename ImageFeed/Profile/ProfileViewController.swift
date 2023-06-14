//  ProfileViewController.swift
//  ImageFeed
//  Created by Adam West on 08.06.23.

import UIKit

final class ProfileViewController: UIViewController {
    
   private var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "avatar")
        imageView.image = image
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var logoutButton: UIButton = {
        var button = UIButton.systemButton(
            with: UIImage(systemName: "ipad.and.arrow.forward")!,
            target: nil,
            action: #selector(didTapButton))
        button.tintColor = .ypRed
        button.tag = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Екатерина Новикова"
        label.textColor = .ypWhite
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var loginNameLabel: UILabel = {
        var label = UILabel()
        label.text = "@ekaterina_nov"
        label.textColor = .ypGray
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        var label = UILabel()
        label.text = "Hello, World!"
        label.textColor = .ypWhite
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .ypBlack
        addToSubview(views: [avatarImageView, nameLabel, loginNameLabel, descriptionLabel, logoutButton])
        addConstraints(constants: [imageViewConstraints, nameLabelConstraints, loginNameLabelConstraints, descriptionLabelConstraints, logoutButtonConstraints])
    }
    
    @objc func didTapButton(button: UIButton) {
    }
    
    private func addToSubview(views: [UIView]) {
        views.forEach { view in
            self.view.addSubview(view)
        }
    }
    
    private func addConstraints(constants: [()->Void]) {
        constants.forEach { constant in
            constant()
        }
    }
    
    private func imageViewConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            avatarImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 70),
            avatarImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func nameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 8),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])
    }
    
    private func loginNameLabelConstraints() {
        NSLayoutConstraint.activate([
            loginNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            loginNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])
    }
    
    private func descriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: loginNameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])
    }
    
    private func logoutButtonConstraints() {
        NSLayoutConstraint.activate([
            logoutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            logoutButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
            ])
    }
}
