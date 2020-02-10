//
//  MyListView.swift
//  DemoNote
//
//  Created by Hoang Tung on 2/5/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class MyListView: UIView {
  
  let iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "list")
    return imageView
  }()
  
  let myNoteLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Trình nhắc"
    label.font = .systemFont(ofSize: 16)
    return label
  }()
  
  let myNoteCountLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "0"
    label.textColor = .systemGray3
    label.textAlignment = .right
    label.font = .systemFont(ofSize: 20)
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addComponents()
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addComponents() {
    self.addSubview(iconImageView)
    self.addSubview(myNoteLabel)
    self.addSubview(myNoteCountLabel)
  }
  
  func setupLayout() {
    iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
    iconImageView.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -16).isActive = true
    iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor, constant: 0).isActive = true
    
    myNoteCountLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor, constant: 0).isActive = true
    myNoteCountLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    myNoteCountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32).isActive = true
    myNoteCountLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
    
    myNoteLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor, constant: 0).isActive = true
    myNoteLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    myNoteLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16).isActive = true
    myNoteLabel.trailingAnchor.constraint(equalTo: myNoteCountLabel.leadingAnchor, constant: -16).isActive = true
    
  }
  
}
