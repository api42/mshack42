//
//  BookingsController.swift
//  mshack
//
//  Created by Apurva Raj on 19/01/19.
//  Copyright © 2019 Apurva Raj. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import GooglePlacesSearchController

class BookingsController: UIViewController , UITextViewDelegate {
    
    lazy var fromLabel: UITextView = {
        let label = UITextView()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = UIColor.gray
        label.isUserInteractionEnabled = true
        label.text = "Pick Location"
        label.backgroundColor = .white
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.tag = 1
        let tap = UITapGestureRecognizer(target: self, action: #selector(fromButtonTapped))
        tap.numberOfTapsRequired = 1
        label.addGestureRecognizer(tap)
        

        return label
    }()
    
    @objc func fromButtonTapped(){
        self.fromLabel.tag = 11
        present(placesSearchController, animated: true, completion: nil)

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if fromLabel.textColor == UIColor.gray {
            fromLabel.text = nil
            fromLabel.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if fromLabel.text.isEmpty {
            fromLabel.text = "Pick Location"
            fromLabel.textColor = UIColor.gray
        }
    }

    lazy var toLabel: UITextView = {
        let label = UITextView()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = UIColor.gray
        label.isUserInteractionEnabled = true
        label.text = "Drop Location"
        label.backgroundColor = .white
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.tag = 2
        let tap = UITapGestureRecognizer(target: self, action: #selector(toButtonTapped))
        tap.numberOfTapsRequired = 1
        label.addGestureRecognizer(tap)
        
        
        return label
    }()

    @objc func toButtonTapped(){
        
        self.toLabel.tag = 22
        present(placesSearchController, animated: true, completion: nil)
    }
    
    lazy var DateSelect: UIDatePicker = {
        let label = UIDatePicker()
        label.backgroundColor = UIColor.rgb(red: 242, green: 242, blue: 242, alpha: 1)
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        
        return label
    }()

    lazy var travelButton: UIButton = {
        let label = UIButton()

        label.setTitle("Travel", for: .normal)
        label.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        label.backgroundColor = UIColor.rgb(red: 230, green: 126, blue: 34, alpha: 1)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(travelButtonTapped))
        tap.numberOfTapsRequired = 1
        label.addGestureRecognizer(tap)

        return label
    }()
    
    @objc func travelButtonTapped() {
        print("time")
        
        let cc = MyTripController(collectionViewLayout: UICollectionViewFlowLayout())
        
        present(cc, animated: true, completion: nil)
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(fromLabel)
        view.addSubview(toLabel)
        
        view.addSubview(DateSelect)
        
        view.addSubview(travelButton)
        
        let mm = 60 + 20 + 60 + 50 + 40
        
        let ms = mm/2
        
        let h = Int((self.view.frame.height)/2)

        let hh = h - ms
        
        fromLabel.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, topConstant: CGFloat(hh/2), leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 60, heightConstant: 60)
        
        toLabel.anchor(top: fromLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: self.view.rightAnchor, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 100, heightConstant: 60)
        

        DateSelect.anchor(top: toLabel.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, topConstant: 50, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 40)
        
        
        travelButton.anchor(top: nil, left: self.view.leftAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        
        
        self.navigationItem.title = "Trippy"
        
        
        fromLabel.delegate = self
        

    }
    
    
    let GoogleMapsAPIServerKey = "AIzaSyALZ769cE-TO7NInkR1V86aFNCVTMDZIps"
    
   lazy var placesSearchController: GooglePlacesSearchController = {
        let controller = GooglePlacesSearchController(delegate: self,
                                                      apiKey: "AIzaSyALZ769cE-TO7NInkR1V86aFNCVTMDZIps",
                                                      placeType: .address
        )

        return controller
    }()

    func textViewDidChange(_ textView: UITextView) {
        print("yes it changed")
//
    }
    
    

}




extension BookingsController: GooglePlacesAutocompleteViewControllerDelegate {
    
    func viewController(didAutocompleteWith place: PlaceDetails) {
        print(place.description)
        
        if self.fromLabel.tag == 11 {
            self.fromLabel.text = place.name
            self.fromLabel.tag = 1
            placesSearchController.isActive = false

        }
        
        if self.toLabel.tag == 22 {
            self.toLabel.text = place.name
            self.fromLabel.tag = 2
            placesSearchController.isActive = false

        }
        
    }
}
