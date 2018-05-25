//
//  ViewModel.swift
//  MVVM
//
//  Created by 洪晨希 on 2018/5/25.
//  Copyright © 2018年 洪晨希. All rights reserved.
//

import Foundation
import UIKit

public typealias ImageDownloadCompletionClosure = (_ imageData: NSData) -> Void

class MessierViewModel {
    private let messierDataModel: MessierDataModel
    private var imageURL: URL
    private var updateDate: Date?
    
    init(messierDataModel: MessierDataModel) {
        self.messierDataModel = messierDataModel
        self.imageURL = URL(string: messierDataModel.imageLink)!
    }
    
    public var formalName: String {
        return "Formal name: " + messierDataModel.formalName
    }
    
    public var commonName: String {
        return "Common name: " + messierDataModel.commonName
    }
    
    public var dateUpdated: String {
        let dateString = String(messierDataModel.updateDate.year)
                        + "-" +
                        String(messierDataModel.updateDate.month)
                        + "-" +
                        String(messierDataModel.updateDate.day)
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy"
        
        if let date = dateFormatterGet.date(from: dateString) {
            updateDate = date
            return "Updated: " + dateFormatterPrint.string(from: date)
        } else {
            return "There was an error decoding the string"
        }
    }
    
    public var textDescription: NSAttributedString {
        let fontAttributes = [NSAttributedStringKey.font:  UIFont(name: "Georgia", size: 14.0)!, NSAttributedStringKey.foregroundColor: UIColor.blue]
        let markedUpDescription = NSAttributedString(string: messierDataModel.description, attributes:fontAttributes)
        return markedUpDescription
    }
    
    public var thumbnail: String {
        return messierDataModel.thumbnail
    }
    
    func download(completionHandler: @escaping ImageDownloadCompletionClosure) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: imageURL)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    let rawImageData = NSData(contentsOf: tempLocalUrl)
                    completionHandler(rawImageData!)
                    print("Successfuly downloaded. Status code: \(statusCode)")
                }
            } else {
                print("Error took place while downloading a file. Error description: \(String(describing: error?.localizedDescription))")
            }
        }
        task.resume()
    }
}

var messierViewModel: [MessierViewModel] = [
    MessierViewModel(messierDataModel: Messier1),
    MessierViewModel(messierDataModel: Messier8),
    MessierViewModel(messierDataModel: Messier57)
]
