//
//  LoginViewController.swift
//  InstaParse
//
//  Created by G. Viho on 3/29/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSignIn(_ sender: Any) {
       
      let username = usernameField.text!
        
       let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password:password) {
          (user: PFUser?, error: Error?) -> Void in
          if user != nil {
              self.performSegue(withIdentifier: "loginSegue", sender: nil)
              
          } else {
            // The login failed. Check error to see why.
              let errorString = error?.localizedDescription
              // Show the errorString somewhere and let the user try again.
                print(errorString)
          }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text

         user.signUpInBackground {
           (succeeded: Bool, error: Error?) -> Void in
           if let error = error {
             let errorString = error.localizedDescription
             // Show the errorString somewhere and let the user try again.
               print(errorString)
           } else {
               self.performSegue(withIdentifier: "loginSegue", sender: nil)
           }
         }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
