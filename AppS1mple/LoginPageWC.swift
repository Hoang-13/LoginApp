//
//  LoginPageWC.swift
//  AppS1mple
//
//  Created by Nguyen Hoang Viet on 12/11/2021.
//

import Firebase
import Toast_Swift
import FirebaseAuth
import FirebaseDatabase

class LoginPageWC: UIViewController {

  @IBOutlet weak var txtUserName: UITextField!
  @IBOutlet weak var txtPassWord: UITextField!

  @IBAction func OnClickLogin(_ sender: Any) {

    Auth.auth().signIn(withEmail: txtUserName.text!, password: txtPassWord.text!) { audata1, error in
        if error != nil
        {
            self.view.makeToast(error!.localizedDescription)
        }
        else
        {
            let vc = MainPageWC(nibName: "MainPageWC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
  }
  
  @IBAction func OnClickRegister(_ sender: Any) {
    let vc = JoinPageWC(nibName: "JoinPageWC", bundle: nil)
    navigationController?.pushViewController(vc, animated: true)
  }
  override func viewDidLoad() {
        super.viewDidLoad()

    }



}
