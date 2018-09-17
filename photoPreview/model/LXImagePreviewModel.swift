//
//  LXImagePreviewModel.swift
//  智慧运营
//
//  Created by 李旭 on 2018/9/10.
//  Copyright © 2018年 李旭. All rights reserved.
//

import UIKit
class LXImagePreviewModel: NSObject {
    private var _imageUrl : URL!
    var imagePath : String?
    var imageData : Data?
    var imageUrl : URL {
        set {
            _imageUrl = newValue
            imagePath = makePath(newValue)
        }
        get{
            return _imageUrl
        }
    }
    private func makePath(_ withUrl : URL)->String{
        let path = DocumentPath + "/Image"
        let manager = FileManager.default
        if !manager.fileExists(atPath: path){
           try? manager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        let name = withUrl.absoluteString
        return path + "/" +  name.kf.md5
    }
}
