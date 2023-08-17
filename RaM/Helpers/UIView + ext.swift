//
//  UIView + ext.swift
//  RaM
//
//  Created by Vlad Dzirko on 17.08.2023.
//

import UIKit

extension UIView {
    
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
