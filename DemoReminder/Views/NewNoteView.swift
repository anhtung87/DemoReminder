//
//  NewNoteView.swift
//  DemoNote
//
//  Created by Hoang Tung on 2/7/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

protocol NewNoteActionView {
  
}

class NewNoteView: UIView, NewNoteActionView {
  
  let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 100)
    scrollView.backgroundColor = .systemGray6
    return scrollView
  }()
  
  let containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemGray6
    return view
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Hôm nay"
    label.font = .boldSystemFont(ofSize: 32)
    label.textColor = .systemBlue
    return label
  }()
  
  let emptyLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Không có lời nhắc"
    label.textColor = .systemGray2
    label.font = .systemFont(ofSize: 18)
    label.textAlignment = .center
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupScrollView()
    setupContainerView()
    setupTitleLabel()
    setupEmptyLabel()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupScrollView() {
    self.addSubview(scrollView)
    
    scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
    scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
  }
  
  func setupContainerView() {
    scrollView.addSubview(containerView)
    
    containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
    containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
    containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    containerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - 100).isActive = true
  }
  
  func setupTitleLabel() {
    containerView.addSubview(titleLabel)
    
    titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
    titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
  }
  
  func setupEmptyLabel() {
    containerView.addSubview(emptyLabel)
    
    emptyLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    emptyLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    emptyLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
    emptyLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
  }
}
