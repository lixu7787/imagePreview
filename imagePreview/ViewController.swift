//
//  ViewController.swift
//  imagePreview
//
//  Created by 李旭 on 2018/9/17.
//  Copyright © 2018年 李旭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var showButton:UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitle("预览图片", for: .normal)
        button.addTarget(self, action: #selector(showImageDetail), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.backgroundColor = .red
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(showButton)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showButton.center = view.center
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc private func showImageDetail(){
        let privew = LXImagePreviewViewController()
        privew.modelArray =  makeImageArray()
        let navi = UINavigationController(rootViewController: privew)
        self.present(navi, animated: true, completion: nil)
    }
    private func makeImageArray()->[LXImagePreviewModel]{
        let modelA = LXImagePreviewModel()
        modelA.imageUrl = URL.init(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536831607798&di=d1e8ca613eb307c6f7f7de8036e64690&imgtype=0&src=http%3A%2F%2Fimg.huafans.cn%2Fdata%2Fattachment%2Fforum%2F201304%2F04%2F211304c53fdzwflddlt85s.jpg")!
        let moddelB = LXImagePreviewModel()
        moddelB.imageUrl = URL.init(string: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3864550099,2385275062&fm=26&gp=0.jpg")!
        let modelC = LXImagePreviewModel()
        modelC.imageUrl = URL.init(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536831766628&di=37011abe55cd348ebee4d3669f266e5f&imgtype=0&src=http%3A%2F%2Fbangimg1.dahe.cn%2Fforum%2F201511%2F06%2F221846mfq6haf2mxllaqhz.jpg")!
        let modelD = LXImagePreviewModel()
        modelD.imageUrl = URL.init(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536831816602&di=3a604f0835548be136ee62ff6c566e47&imgtype=0&src=http%3A%2F%2Fpic6.wed114.cn%2F20130721%2F2013072103535728624.jpg")!
        return [modelA,moddelB,modelC,modelD]
    }

}

