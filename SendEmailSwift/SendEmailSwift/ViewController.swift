//
//  ViewController.swift
//  SendEmailSwift
//
//  Created by Boss on 11/26/20.
//  Copyright © 2020 Boss. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var data: Data? // khởi tạo file đính kèm

    override func viewDidLoad() {
        super.viewDidLoad()
        creatFileCSV()
    }
    
    func creatFileCSV() {
        let mailString = NSMutableString()
        mailString.append("123456")
        mailString.append("Khi nao ta co nhau")
        data = mailString.data(using: String.Encoding.utf8.rawValue, allowLossyConversion: true)
    }
    
    func cofigureMail() -> MFMailComposeViewController {
        let emailController = MFMailComposeViewController()
        emailController.mailComposeDelegate = self
        emailController.setSubject("File Gui Di")
        emailController.setMessageBody("ALOOOOO", isHTML: false)
        emailController.addAttachmentData(data!, mimeType: "text/csv", fileName: "FileDinhKem.csv")
        
        return emailController
        
    }
    
    // MARK: Action
    @IBAction func onTapSendEmail(_ sender: UIButton) {
        let email = cofigureMail()
        if MFMailComposeViewController.canSendMail() {
            self.present(email, animated: true, completion: nil)
        }
    }


}

