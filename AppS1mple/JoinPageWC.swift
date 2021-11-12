//
//  JoinPageWC.swift
//  AppS1mple
//
//  Created by Nguyen Hoang Viet on 11/11/2021.
//

import UIKit
import Firebase
import Toast_Swift
import FirebaseDatabase


class JoinPageWC: UIViewController {
  var ref: DatabaseReference!



  @IBOutlet weak var textUserName: UITextField!



  @IBOutlet weak var TextPassword: UITextField!
  @IBOutlet weak var textRePassword: UITextField!
  @IBOutlet weak var Email: UITextField!

  @IBOutlet weak var DatePackerBirday: UIDatePicker!

  @IBAction func OnclickCheckButton(_ sender: Any) {
    let user = Auth.auth().currentUser
    if let user = user {
      let uid = user.uid
      let email = user.email
      let photoURL = user.photoURL
      var multiFactorString = "MultiFactor: "
      for info in user.multiFactor.enrolledFactors {
        multiFactorString += info.displayName ?? "[DispayName]"
        multiFactorString += " "
      }
      // ...
    }
    if (textUserName.text == user?.email) {
      self.view.makeToast("Bạn nhập trùng email")
    } else {
      self.view.makeToast("Gmail bạn hợp lệ")
    }
  }
  @IBAction func OnClickJoinButton(_ sender: Any) {
        view.endEditing(true)
    ref.child("textUserName").setValue(["message" : self.textUserName.text!])
    if textUserName.text == "" || TextPassword.text == "" || textRePassword.text == "" || Email.text == ""
        {
            self.view.makeToast("Bạn chưa điền đầy đủ thông tin")
        }
        else if TextPassword.text != textRePassword.text
        {
            self.view.makeToast("Điền lại mật khẩu không đúng")
        }
        else
        {
           Auth.auth().createUser(withEmail: Email.text! , password: textRePassword.text!) { Audata, erros in
                if erros != nil {
                    self.view.makeToast(erros!.localizedDescription)
                }
                else
                {

                            self.view.makeToast("Sign in success")
                        }
                    }
                }



    }


  @IBAction func OnClickBackButton(_ sender: Any) {

    let  vc = LoginPageWC(nibName: "LoginPageWC", bundle: nil)
      navigationController?.pushViewController(vc, animated: true)


  }

  override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }




}
