//
//  Photos.swift
//  Navigation
//
//  Created by apple on 23.04.2022.
//

import UIKit

struct Photos {
    
    var image: UIImage
    
    static func makePhotoForGallary() -> [Photos] {
        
        var photos = [Photos]()
        photos.append(Photos(image: UIImage(named: "1")!))
        photos.append(Photos(image: UIImage(named: "2")!))
        photos.append(Photos(image: UIImage(named: "3")!))
        photos.append(Photos(image: UIImage(named: "4")!))
        photos.append(Photos(image: UIImage(named: "5")!))
        photos.append(Photos(image: UIImage(named: "6")!))
        photos.append(Photos(image: UIImage(named: "7")!))
        photos.append(Photos(image: UIImage(named: "8")!))
        photos.append(Photos(image: UIImage(named: "9")!))
        photos.append(Photos(image: UIImage(named: "10")!))
        photos.append(Photos(image: UIImage(named: "11")!))
        photos.append(Photos(image: UIImage(named: "12")!))
        photos.append(Photos(image: UIImage(named: "13")!))
        photos.append(Photos(image: UIImage(named: "14")!))
        photos.append(Photos(image: UIImage(named: "15")!))
        photos.append(Photos(image: UIImage(named: "16")!))
        photos.append(Photos(image: UIImage(named: "17")!))
        photos.append(Photos(image: UIImage(named: "18")!))
        photos.append(Photos(image: UIImage(named: "19")!))
        photos.append(Photos(image: UIImage(named: "20")!))
        return photos
    }
    
    static func makePhotoForPreview() -> [Photos] {
        var photos = [Photos]()
        photos.append(Photos(image: UIImage(named: "1")!))
        photos.append(Photos(image: UIImage(named: "2")!))
        photos.append(Photos(image: UIImage(named: "3")!))
        photos.append(Photos(image: UIImage(named: "4")!))
        return photos
    }
}


