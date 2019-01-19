//
//  MyTripController.swift
//  mshack
//
//  Created by Apurva Raj on 19/01/19.
//  Copyright © 2019 Apurva Raj. All rights reserved.
//

import UIKit


class MyTripController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    lazy var back: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(25)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.isUserInteractionEnabled = true
        label.text = "X"
        label.backgroundColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissV))
        tap.numberOfTapsRequired = 1
        label.addGestureRecognizer(tap)

        
        return label
    }()
    
    let nview = UIView()
    
    lazy var showPrice: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(25)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.isUserInteractionEnabled = true
        label.text = "4999 INR"
        label.backgroundColor = UIColor.rgb(red: 241, green: 196, blue: 15, alpha: 1)
        
        return label
    }()
    

    @objc func dismissV(){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(CardView.self, forCellWithReuseIdentifier: "CardView")
        self.view.backgroundColor = UIColor.white
        
        
        self.collectionView.backgroundColor = .clear
        
        view.addSubview(back)
        back.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 40, heightConstant: 40)
        
        collectionView?.contentInset = UIEdgeInsets(top: 40, left: 40, bottom: 0, right: 40)
        
        view.addSubview(showPrice)
        showPrice.anchor(top: nil, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 130)
        
        nview.backgroundColor = UIColor.rgb(red: 241, green: 196, blue: 15, alpha: 1)
//        view.addSubview(nview)
//
//        nview.anchor(top: showPrice.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        setupFont()

    }
    
    func setupFont(){
        let attributedText = NSMutableAttributedString(string: "Pay", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)])
        
        attributedText.append(NSAttributedString(string: " 4999 INR" , attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25)]))
        
        showPrice.attributedText = attributedText
        
        
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: view.frame.width - 80, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardView", for: indexPath) as! CardView
            
            return cell

        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardView", for: indexPath) as! CardView
            
            return cell

        }
    }
    
}
