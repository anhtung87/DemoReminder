//
//  TypeListCollectionViewCell.swift
//  DemoNote
//
//  Created by Hoang Tung on 2/5/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class TypeListCollectionViewCell: UICollectionViewCell {
  let containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.layer.cornerRadius = 12
    return view
  }()
  
  let photoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "box")
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "1"
    label.textColor = .systemGray
    label.font = .boldSystemFont(ofSize: 18)
    return label
  }()
  
  let numberLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "1"
    label.textColor = .black
    label.textAlignment = .right
    label.font = .boldSystemFont(ofSize: 32)
    return label
  }()
  
  // MARK: view life cycle
  
  override init(frame: CGRect) {
      super.init(frame: frame)
      
      setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  func setupLayout() {
    addSubview(containerView)
    containerView.addSubview(photoImageView)
    containerView.addSubview(titleLabel)
    containerView.addSubview(numberLabel)
    
    containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
    containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
    containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    
    photoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
    photoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
    photoImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor, multiplier: 1).isActive = true
    
    titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 8).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4).isActive = true
    titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 4).isActive = true
    
    numberLabel.centerYAnchor.constraint(equalTo: photoImageView.centerYAnchor).isActive = true
    numberLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
    numberLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 4).isActive = true
    numberLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 8).isActive = true
  }
}
