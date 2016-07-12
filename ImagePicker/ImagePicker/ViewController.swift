//
//  ViewController.swift
//  ImagePicker
//
//  Created by Kevin Casado on 6/30/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate ,UITextFieldDelegate{
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var bottomTextField: UITextField!

    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    let fontTextAttributes = [
        NSStrokeColorAttributeName :UIColor.blackColor(),
        NSForegroundColorAttributeName: UIColor.blackColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size:40)!,
        NSStrokeWidthAttributeName: NSNumber.init(float: 4.5)
    
    
    ]
    
    //Structure used for the Meme
  
    
    //Creates a new meme struct
    func save(){
        
        let meme = Meme(topText: topTextField.text, bottomText: bottomTextField.text, image: imageView.image, memeImage: generateMemeImage())
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
    }
    
    //Used for text field delegate
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text=""
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    
    
    //Used to create a image with the top and bottom text field
    func generateMemeImage()->UIImage{
        toolbar.hidden=true
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawViewHierarchyInRect(self.view.frame,
                                     afterScreenUpdates: true)
        let memedImage : UIImage =
            UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        toolbar.hidden=false
        return memedImage
    }
    override func viewDidLoad() {
        self.topTextField.delegate = self
        self.bottomTextField.delegate=self
        topTextField.defaultTextAttributes=fontTextAttributes
        bottomTextField.defaultTextAttributes = fontTextAttributes
        
        
        super.viewDidLoad()
        topTextField.text="Top"
        bottomTextField.text="Bottom"
        topTextField.textAlignment = NSTextAlignment.Center
        bottomTextField.textAlignment=NSTextAlignment.Center
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    func subscribeToKeyboardNotifications(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,selector: #selector(ViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification,object: nil)
    }
    func unsubscribeFromKeyboardNotifications(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: "UIKeyboardWillShow:", object: nil)
        
        
    }
    func keyboardWillHide(notification: NSNotification){
        view.frame.origin.y = 0
    }
    func keyboardWillShow(notification: NSNotification){
        view.frame.origin.y -= getKeyboardHeight(notification)
    }
    func getKeyboardHeight(notification: NSNotification) ->CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.CGRectValue().height
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        subscribeToKeyboardNotifications()
        //shareButton.enabled=CGSizeEqualToSize(imageView!.image!.size, CGSizeZero)
        if(imageView.image == nil){
            shareButton.enabled = false
        }
        cameraButton.enabled=UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func pickAnImageFromCamera(sender: AnyObject) {
        let pickerController = UIImagePickerController()
        
        pickerController.delegate = self
        pickerController.sourceType=UIImagePickerControllerSourceType.Camera
        presentViewController(pickerController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func pickAnImage(sender: AnyObject) {
        let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType=UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(pickerController, animated: true, completion: nil)
        
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        shareButton.enabled=true
        
        dismissViewControllerAnimated(true, completion: nil)
        
        if let image = info[ UIImagePickerControllerOriginalImage ] as? UIImage{
                imageView.image = image
        }
        shareButton.enabled=true
        
    }

    @IBAction func shareMeme(sender: AnyObject) {
       let image =  generateMemeImage()
        let act = UIActivityViewController(activityItems:[image], applicationActivities:[])
        presentViewController(act,animated:true,completion:nil)
        act.completionWithItemsHandler = {(activityType, completed:Bool, returnedItems:[AnyObject]?, error: NSError?) in
            
            // Return if cancelled
            if (!completed) {
                return
            }
            self.save()
            act.dismissViewControllerAnimated(false, completion: nil)
            return
            
            
        }
        
    
    }
}

