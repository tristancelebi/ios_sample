//
//  NewsVC.swift
//  TapglueSample
//
//  Created by Özgür Celebi on 16/12/15.
//  Copyright © 2015 Özgür Celebi. All rights reserved.
//

import UIKit
import Tapglue

class NewsVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    let url = "https://www.tapglue.com/blog/"
    
    // TGEvent arr
    var currentUserEvents: [TGEvent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadTapglueBlogPage(url)
    }
    
    @IBAction func goHome(sender: UIBarButtonItem) {
        loadTapglueBlogPage(url)
    }
    
    @IBAction func doRefresh(sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func goBack(sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func goForward(sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    @IBAction func bookmarkButtonPressed(sender: UIBarButtonItem) {
        Tapglue.createEventWithType("bookmark_event", onObjectWithId: (webView.request?.URL?.absoluteString)!)
    }
    
    @IBAction func likeButtonPressed(sender: UIBarButtonItem) {
        Tapglue.createEventWithType("like_event", onObjectWithId: (webView.request?.URL?.absoluteString)!)
    }
    
    func loadTapglueBlogPage(str: String){
        let requestURL = NSURL(string: str)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
}
