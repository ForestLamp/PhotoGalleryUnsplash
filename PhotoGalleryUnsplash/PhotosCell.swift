//
//  PhotosCell.swift
//  PhotoGalleryUnsplash
//
//  Created by Alex Ch. on 04.05.2022.
//

import UIKit
import SDWebImage

class PhotosCell: UICollectionViewCell {
    
    static let reuseID = "PhotosCell"
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let autorTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .gray
        textField.contentMode = .center
        return textField
    }()
    
    var unsplashPhoto: UnsplashPhoto! {
        didSet {
            let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
            photoImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addImageView()
        addTextField()
    }
    
    private func addImageView(){
        addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func addTextField(){
        addSubview(autorTextField)
        autorTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        autorTextField.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -2).isActive = true
        autorTextField.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: -2).isActive = true
        autorTextField.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: -2).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
