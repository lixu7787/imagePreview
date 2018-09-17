
//
//  LXImagePreviewCollectionViewCell.swift
//  智慧运营
//
//  Created by 李旭 on 2018/9/10.
//  Copyright © 2018年 李旭. All rights reserved.
//

import UIKit
import Kingfisher
class LXImagePreviewCollectionViewCell: UICollectionViewCell,UIScrollViewDelegate{
    
    private var _imageModel : LXImagePreviewModel!
    var imageModel : LXImagePreviewModel {
        set{
            _imageModel = newValue
            if let data = newValue.imageData {
                 imageView.image = UIImage(data: data)
            }
            controlImageShow(model: newValue)
        }
        get{
            return _imageModel
        }
    }
    private func controlImageShow(model : LXImagePreviewModel){
        if let image = UIImage(contentsOfFile: model.imagePath!){
            imageView.image = image
            progressView.isHidden = true
        }else{
            progressView.isHidden = false
            imageView.kf.setImage(with: ImageResource(downloadURL : model.imageUrl), placeholder: nil, options: nil, progressBlock: { (all, downloaded) in
                self.progressView.progress = CGFloat(downloaded) / CGFloat(all)
            }) { (image, error, type, url) in
                self.imageView.image = image
                self.progressView.isHidden = true
                self.saveImage(image: image!)
            }
        }
        
    }
    private func saveImage(image : UIImage){
        if let imageData = UIImageJPEGRepresentation(image, 1) as NSData? {
            imageData.write(toFile: _imageModel.imagePath!, atomically: false)
        }
    }
    lazy private var progressView : LXProgressView = {
        let pro = LXProgressView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        pro.isHidden = true
        return pro
    }()
    lazy private var imageView : UIImageView = {
        let image = UIImageView(frame: self.bounds)
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.numberOfTouchesRequired = 1
        doubleTap.numberOfTapsRequired = 2
        image.addGestureRecognizer(doubleTap)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        tap.numberOfTouchesRequired = 1
        tap.numberOfTapsRequired = 1
        image.addGestureRecognizer(tap)
        tap.require(toFail: doubleTap)
        return image
    }()
    @objc private func doubleTapAction(){
        if let nav = self.responderViewController().navigationController{
            nav.navigationBar.isHidden = true
        }
        UIApplication.shared.isStatusBarHidden = true
        if backScroll.zoomScale == 1.0 {
            UIView.animate(withDuration: 0.5) {
                self.backScroll.zoomScale = 3.0
            }
        }else{
            self.backScroll.zoomScale = 1.0
        }
    }
    @objc private func tapAction(){
        if let nav = self.responderViewController().navigationController{
            nav.navigationBar.isHidden = !nav.navigationBar.isHidden
        }
        UIApplication.shared.isStatusBarHidden = !UIApplication.shared.isStatusBarHidden
    }
    lazy private var backScroll : UIScrollView = {
        let scroll = UIScrollView(frame: self.bounds)
        scroll.minimumZoomScale = 1
        scroll.maximumZoomScale = 3
        scroll.delegate = self
        scroll.bounces = true
        return scroll
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(backScroll)
        backScroll.addSubview(imageView)
        progressView.center = self.center
        self.addSubview(progressView)
    }
    @objc
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LXImagePreviewCollectionViewCell{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        var xcenter = scrollView.center.x
        var ycenter = scrollView.center.y
        xcenter = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width/2:xcenter
        ycenter = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height/2:ycenter
        imageView.center = CGPoint(x: xcenter, y: ycenter)
    }
}
