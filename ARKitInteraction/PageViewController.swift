//
//  PageViewController.swift
//  ARKitInteraction
//
//  Created by admin on 2021/6/6.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit

class PageViewController: UIViewController, UIScrollViewDelegate {


    @IBOutlet var scroll: UIScrollView!
    override  func  viewDidLoad() {
        
             super .viewDidLoad()
        scroll.frame = CGRect(x:0,y:132,width:414,height:764)
        let  imageView = UIImageView (image: UIImage (named: "bigpic" ))
        imageView.frame = CGRect(x:0,y:0,width:380,height:1160)
        scroll.contentSize = imageView.bounds.size;
        scroll.addSubview(imageView);
        self .view.addSubview(scroll)
    }
}
