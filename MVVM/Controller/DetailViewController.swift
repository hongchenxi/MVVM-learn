//
//  DetailViewController.swift
//  MVVM
//
//  Created by 洪晨希 on 2018/5/25.
//  Copyright © 2018年 洪晨希. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var messierViewModel: MessierViewModel?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.alpha = 0.0
        
        let imageCompletionClosure = {( imageData: NSData) -> Void in
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1.0, animations: {
                    self.imageView.alpha = 1.0
                    self.imageView.image = UIImage(data: imageData as Data)
                    self.view.setNeedsDisplay()
                })
                self.activitySpinner.stopAnimating()
            }
        }
        activitySpinner.startAnimating()
        
        titleLabel.text = messierViewModel?.formalName
        subtitleLabel.text = messierViewModel?.commonName
        updatedLabel.text = messierViewModel?.dateUpdated
        descriptionTextView.attributedText = messierViewModel?.textDescription
        
        messierViewModel?.download(completionHandler: imageCompletionClosure)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.descriptionTextView.setContentOffset(CGPoint.zero, animated: false)
    }

}
