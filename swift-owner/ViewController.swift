//
//  ViewController.swift
//  swift-owner
//
//  Created by sen on 16/9/18.
//  Copyright © 2016年 sen. All rights reserved.
//

import UIKit
import StoreKit  //商店


class ViewController: UIViewController,SKStoreProductViewControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    lazy var tabview:UITableView = {
        let _tabview = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
        return _tabview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = UIColor.randomColor()
        
//        tabview.mj_header = setupHeaderRefresh(target: self, action: #selector())
       
    }
    ///跳转应用商店===>应用评价
    func jumpToAppstore(){
        let store = SKStoreProductViewController()
        store.delegate = self
        store.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier : "APPLE_ID"]) { (success, error) in
            if success {
                self.present(store, animated: true, completion: nil)
            } else {
                print(error)
            }
        }
        
    }
    ///SKStoreProductViewControllerDelegate
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    ///清除缓存  cell
//    let group1CellModel1 = JFProfileCellLabelModel(title: "清除缓存", text: "\(String(format: "%.2f", CGFloat(YYImageCache.sharedCache().diskCache.totalCost()) / 1024 / 1024))M")
//         group1CellModel1.operation = { () -> Void in
//              JFProgressHUD.showWithStatus("正在清理")
//              SDImageCache.sharedImageCache().cleanDisk()
//          YYImageCache.sharedCache().memoryCache.removeAllObjects()
//            YYImageCache.sharedCache().diskCache.removeAllObjectsWithBlock({
//            JFProgressHUD.showSuccessWithStatus("清理成功")
//            group1CellModel1.text = "0.00M"
//            dispatch_async(dispatch_get_main_queue(), {
//          self.tableView.reloadData()
//        })
//     })
//    }
    
    /**
     配置imagePicker
     
     - parameter sourceType:  资源类型
     */
    let imagePickerC = UIImagePickerController()
    func setupImagePicker(sourceType: UIImagePickerControllerSourceType) {
        
//        imagePickerC.view.backgroundColor = COLOR_ALL_BG
        imagePickerC.delegate = self
        imagePickerC.sourceType = sourceType
        imagePickerC.allowsEditing = true
        imagePickerC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
    }

    ///头像按钮点击      上传的时候需要base64加密
    func didTappedAvatarButton() {
        let alertC = UIAlertController()
        let takeAction = UIAlertAction(title: "拍照", style: UIAlertActionStyle.default, handler: { (action) in
            if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                GRProgressHUD.showInfoWithStatus(status: "摄像头不可用")
                return
            }
            self.setupImagePicker(sourceType: .camera)
            self.present(self.imagePickerC, animated: true, completion: {})
        })
        let photoLibraryAction = UIAlertAction(title: "从相册选择照片", style: UIAlertActionStyle.default, handler: { (action) in
            if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                GRProgressHUD.showInfoWithStatus(status: "相册不可用")
                return
            }
            self.setupImagePicker(sourceType: .photoLibrary)
            self.present(self.imagePickerC, animated: true, completion: {})
        })
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: { (action) in
            
        })
        alertC.addAction(takeAction)
        alertC.addAction(photoLibraryAction)
        alertC.addAction(cancelAction)
        self.present(alertC, animated: true, completion: {})
    }

    // MARK: - UINavigationControllerDelegate, UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        let newImage = image.resizeImageWithNewSize(newSize: CGSize(width: 150, height: 150))
        uploadUserAvatar(image: newImage)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    /**
     上传用户头像
     
     - parameter image: 头像图   上传的时候需要base64加密
     */
    func uploadUserAvatar(image: UIImage) {
//        let imageData = UIImageJPEGRepresentation(avatarImage, 1)!
//        let imageBase64 = imageData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue:0))
        
    }

    
    
    
}

