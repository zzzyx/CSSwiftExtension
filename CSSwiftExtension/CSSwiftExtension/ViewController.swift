//
//  ViewController.swift
//  CSSwiftExtension
//
//  Created by Chris Hu on 16/12/22.
//  Copyright © 2016年 com.icetime17. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var btnTest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testBlurImageView()
        
        testAnotherImageView()
        
        addBtnTest()
    }
    
    private func addBtnTest() {
        btnTest = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 30))
        btnTest.backgroundColor = UIColor.black
        view.addSubview(btnTest)
        btnTest.setTitle("Test", for: .normal)
        btnTest.addTarget(self, action: .actionBtnTest, for: .touchUpInside)
    }
    
    private func testBlurImageView() {
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 500), blurEffectStyle: .light)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        imageView.backgroundColor = UIColor(hexString: 0x123456, alpha: 0.5)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.center = view.center
        imageView.image = UIImage(named: "Model.jpg")
    }

    func testAnotherImageView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        imageView.backgroundColor = UIColor(hexString: 0x123456, alpha: 0.5)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.center = view.center
        imageView.image = UIImage(named: "Model.jpg")?.cs_grayScale()
        imageView.alpha = 0.5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func actionBtnTest() {
        btnTest.cs_cornerRadius(corners: [.bottomLeft, .bottomRight], radius: 20)
        
        guard let aView = AView.cs_loadFromNib("AView") as? AView else { return }
        aView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        aView.center = view.center
        view.addSubview(aView)
        aView.lbTitle.text = "TestView"
    }

}


// MARK: - Selector
private extension Selector {
    static let actionBtnTest = #selector(ViewController.actionBtnTest)
}


