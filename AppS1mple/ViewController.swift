//
//  ViewController.swift
//  AppS1mple
//
//  Created by Nguyen Hoang Viet on 11/11/2021.
//

import UIKit
import Firebase
import Toast_Swift
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
  private let database = Database.database().reference()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    loadPageWC()
  }
  func loadPageWC() {
    let vc = LoginPageWC(nibName: "LoginPageWC", bundle: nil)
    navigationController?.pushViewController(vc, animated: true)
  }
}

