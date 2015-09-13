//
//  LoginViewController.swift
//  2werk
//
//  Created by Madison Pfaff on 9/12/15.
//
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var pw: UITextField!
    @IBOutlet weak var username: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions) {
    (user: PFUser?, error: NSError?) -> Void in
    if let user = user {
    if user.isNew {
    println("User signed up and logged in through Facebook!")
    } else {
    println("User logged in through Facebook!")
    }
    } else {
    println("Uh oh. The user cancelled the Facebook login.")
    }
    }

    @IBAction func loginButtonPressed(sender: AnyObject) {
        if let theUserName = username.text, thePw = pw.text {
            PFUser.logInWithUsernameInBackground(theUserName, password:thePw) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    // Do stuff after successful login.
                    self.performSegueWithIdentifier("showNetworkSegue", sender: self)
                } else {
                    // The login failed. Check error to see why.
                }
            }
        }

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        print("\(segue.destinationViewController)")
//    }

}
