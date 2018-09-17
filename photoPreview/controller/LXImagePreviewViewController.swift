//
//  LXImagePreviewViewController.swift
//  智慧运营
//
//  Created by 李旭 on 2018/9/10.
//  Copyright © 2018年 李旭. All rights reserved.
//

import UIKit
let LXreuseIdentifier = "LXImagePrewIdentifier"
class LXImagePreviewViewController: UIViewController {
    var modelArray : [LXImagePreviewModel]!
    private lazy var collectionView : UICollectionView = {
        let flowLayout = LXImagePrivewLayout()
        flowLayout.itemSize = view.bounds.size
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        collection.bounces = true
        collection.register(LXImagePreviewCollectionViewCell.self, forCellWithReuseIdentifier: LXreuseIdentifier)
        collection.delegate = self
        collection.dataSource = self
        collection.isPagingEnabled = true
        return collection
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(collectionView)
        configNavigationBar()
    }
    private func configNavigationBar(){
        title = "预览"
        let button = UIButton.init(type: .custom)
        button.setTitle("取消", for:.normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(closePrivewImage), for: .touchUpInside)
        let rightItem = UIBarButtonItem.init(customView: button)
        navigationItem.rightBarButtonItem = rightItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(getBarImage(YRGBColorFromHexAndAlpha(rgb: 0xCCEEFF, alpha: 0.3)), for: .default)
    }
    @objc private func closePrivewImage(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    private func getBarImage(_ color : UIColor)->UIImage{
      let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
      UIGraphicsBeginImageContext(rect.size)
      let context = UIGraphicsGetCurrentContext()
      context?.setFillColor(color.cgColor)
      context?.fill(rect)
      return UIGraphicsGetImageFromCurrentImageContext()!
    }
}
extension LXImagePreviewViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LXreuseIdentifier, for: indexPath) as! LXImagePreviewCollectionViewCell
        cell.imageModel = modelArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
    
}
