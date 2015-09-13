//
//  SignUpViewController.swift
//  2werk
//
//  Created by Madison Pfaff on 9/12/15.
//
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUp(sender:AnyObject) {
        let user = PFUser()
        user.username = userName.text
        user.password = userPassword.text
        user.email = userEmail.text
        // other fields can be set just like with PFObject
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let theError = error {
                let errorString = theError.userInfo["error"] as! NSString
                
                let alert = UIAlertController(title: "Error :p", message: errorString as String, preferredStyle: UIAlertControllerStyle.Alert)
                let button = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(button)
                
                self.presentViewController(alert, animated: true, completion: nil)
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
