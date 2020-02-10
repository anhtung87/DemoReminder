//
//  ViewController.swift
//  DemoReminder
//
//  Created by Hoang Tung on 2/10/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

protocol MainViewControllerLogic: class {
  func routeToNewNote(title: String)
}

class ViewController: UIViewController, HasCustomView, MainViewControllerLogic {
  typealias CustomView = MainView
  
  let navigationTitle: UILabel = {
    let label = UILabel()
    label.text = "Danh sách"
    label.textColor = .systemGray6
    return label
  }()
  
  let fakeNotes = [
    TypeNote(imageName: "calendar", title: "Hôm nay", count: 0),
    TypeNote(imageName: "timer", title: "Lịch dự kiến", count: 0),
    TypeNote(imageName: "box", title: "Tất cả", count: 0),
    TypeNote(imageName: "tag", title: "Đã gắn cờ", count: 0)
  ]
  
  //  MARK: View lifecycle
  
  override func loadView() {
    let customView = CustomView()
    view = customView
    setupNavigation()
    showDefaultReminderTypes()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    customView.viewController = self
  }
  
    func setupNavigation() {
      let fixButton = UIBarButtonItem(title: "Sửa", style: .plain, target: self, action: nil)
      navigationItem.rightBarButtonItem = fixButton
      navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
      navigationController?.navigationBar.shadowImage = UIImage()
  //    navigationController?.navigationBar.isTranslucent = true
      navigationController?.view.backgroundColor = .systemGray6
//      navigationController?.navigationBar.topItem?.title = ""
      navigationController?.navigationBar.topItem?.titleView = navigationTitle
    }
  
  func showDefaultReminderTypes() {
    customView.typeList = fakeNotes.map { (note) -> Main.TypeList.ViewModel.DisplayedType in
      return Main.TypeList.ViewModel.DisplayedType(imageName: note.imageName, title: note.title, count: String(note.count))
    }
  }
  
  func routeToNewNote(title: String) {
    let destinationVC = NewNoteViewController()
    navigationController?.show(destinationVC, sender: nil)
    navigationController?.navigationBar.topItem?.title = "Danh sách"
    destinationVC.titleNote = title
  }
}

