//
//  Resources.swift
//  RaM
//
//  Created by Vlad Dzirko on 16.08.2023.
//

import UIKit

enum Resources {
    enum Colors {
        
        static let mainBackground = UIColor(hexString: "#040C1E")
        static let backgoundCells = UIColor(hexString: "#262A38")
        
        static let mainFontColor = UIColor(hexString: "#FFFFFF")
        static let secondFontColor = UIColor(hexString: "#C4C9CE")
        static let greenFontColor = UIColor(hexString: "#47C60B")
        
        static let planetCell = UIColor(hexString: "191C2A")
    }
    
    enum Images {
        enum Splash {
            static let logo = UIImage(named: "logo")
            static let hole = UIImage(named: "hole")
            static let stars = UIImage(named: "stars")
        }
        
        enum Detail {
            static let planet = UIImage(named: "planet")
        }
    }
}
