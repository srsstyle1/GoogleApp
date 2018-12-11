//
//  ViewController.swift
//  GoogleApp
//  Created by Sagar on 15/11/18.
//  Copyright © 2018 Sagar. All rights reserved.
//

import UIKit
import WebKit
import ASToast
class ViewController: UIViewController {

    @IBOutlet weak var wbv: UIWebView!
    override func viewDidLoad() {
        wbv.delegate = self
        super.viewDidLoad()
        self.wbv.loadRequest(URLRequest(url: URL(string: "https://www.google.co.in/")!))
        self.view.makeToast(message: "Error in Network Connection",
                            backgroundColor: nil,
                            messageColor: UIColor.blue)
       
    }

    @IBAction func nextVc(_ sender: Any) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController? = storyboard.instantiateViewController(withIdentifier: "new")
        present(vc!, animated: true) {() -> Void in }
    }
    
    @IBAction func paymentVc(_ sender: Any) {
       self.performSegue(withIdentifier: "qqq", sender: self)
    }
}

extension ViewController: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        //activityIndicator.stopAnimating()
        print("Finished loading")
    }
    private func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        //activityIndicator.stopAnimating()
        print("webview did fail load with error: \(error)")
    }
}

