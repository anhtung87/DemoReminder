//
//  MainView.swift
//  DemoNote
//
//  Created by Hoang Tung on 2/4/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

protocol HasCustomView {
  associatedtype CustomView: UIView
}

extension HasCustomView where Self: UIViewController {
  internal var customView: CustomView {
    guard let customView = view as? CustomView else {
      fatalError("Yêu cầu view kiểu \(CustomView.self) nhưng nhận được \(type(of: view))")
    }
    return customView
  }
}

protocol MainActionLogic {
}

class MainView: UIView, MainActionLogic {
  weak var viewController: MainViewControllerLogic?
  
  let searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    return searchBar
  }()
  
  let typeListCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(TypeListCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    return collectionView
  }()
  
  let myListLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "DS của tôi"
    label.font = .boldSystemFont(ofSize: 20)
    return label
  }()
  
  let myNoteView: MyListView = {
    let view = MyListView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 12
    view.backgroundColor = .white
    return view
  }()
  
  var typeList: [Main.TypeList.ViewModel.DisplayedType] = []
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .systemGray6
    setupSearchBar()
    setupCollectionView()
    setupMyListView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupSearchBar() {
    self.addSubview(searchBar)
    // setup constraint
    searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 80).isActive = true
    searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
    searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
    searchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    // setup background
    searchBar.backgroundImage = UIImage()
  }
  
  func setupCollectionView() {
    self.addSubview(typeListCollectionView)
    // setup constraint
    typeListCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 32).isActive = true
    typeListCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    typeListCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    typeListCollectionView.heightAnchor.constraint(greaterThanOrEqualTo: self.heightAnchor, multiplier: 0.25).isActive = true
    
    typeListCollectionView.delegate = self
    typeListCollectionView.dataSource = self
    typeListCollectionView.backgroundColor = .systemGray6
    
    // thay đổi hướng scroll của collectionView
    if let flowLayout = typeListCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        flowLayout.scrollDirection = .vertical
    }
  }
  
  func setupMyListView() {
    self.addSubview(myListLabel)
    //setup constraint
    myListLabel.topAnchor.constraint(equalTo: typeListCollectionView.bottomAnchor, constant: 32).isActive = true
    myListLabel.leadingAnchor.constraint(equalTo: typeListCollectionView.leadingAnchor, constant: 8).isActive = true
    myListLabel.trailingAnchor.constraint(equalTo: typeListCollectionView.trailingAnchor, constant: 0).isActive = true
    myListLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 36).isActive = true
    
    self.addSubview(myNoteView)
    myNoteView.topAnchor.constraint(equalTo: myListLabel.bottomAnchor, constant: 8).isActive = true
    myNoteView.leadingAnchor.constraint(equalTo: typeListCollectionView.leadingAnchor, constant: 0).isActive = true
    myNoteView.trailingAnchor.constraint(equalTo: typeListCollectionView.trailingAnchor, constant: 0).isActive = true
    myNoteView.heightAnchor.constraint(equalToConstant: 64).isActive = true
  }
}

extension MainView:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return typeList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = typeListCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TypeListCollectionViewCell
    cell.photoImageView.image = UIImage(named: typeList[indexPath.row].imageName)
    cell.titleLabel.text = typeList[indexPath.row].title
    cell.numberLabel.text = typeList[indexPath.row].count
    return cell
  }
  
  // function trả về kích thước của Item
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let widthSize = ((collectionView.frame.size.width - 17) / 2)
    let heightSize = ((collectionView.frame.size.height - 17) / 2)
    return CGSize(width: widthSize, height: heightSize)
  }
  
  // function trả về khoảng cách giữa 2 hàng
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 16
  }
  
  // hàm trả về khoảng cách giữa 2 item (tương tự 2 cột)
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 16
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as! TypeListCollectionViewCell
    viewController?.routeToNewNote(title: cell.titleLabel.text!)
  }
}
