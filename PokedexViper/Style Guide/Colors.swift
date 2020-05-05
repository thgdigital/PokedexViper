//
//  Colors.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 03/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit



extension UIColor {
    
    static var bugType = UIColor(hex: "#8CB230")
    static var darkType = UIColor(hex: "#58575F")
    static var dragonType = UIColor(hex: "#0F6AC0")
    static var electricType = UIColor(hex: "#EED535")
    static var fairyType = UIColor(hex: "#ED6EC7")
    static var fightingType = UIColor(hex: "#D04164")
    static var fireType = UIColor(hex: "#FD7D24")
    static var flyingType = UIColor(hex: "#748FC9")
    static var ghostType = UIColor(hex: "#556AAE")
    static var grassType = UIColor(red: 0.551, green: 0.7, blue: 0.187, alpha: 1)
    static var groundType = UIColor(hex: "#DD7748")
    static var iceType = UIColor(hex: "#61CEC0")
    static var normalType = UIColor(hex: "#9DA0AA")
    static var poisonType = UIColor(hex: "#A552CC")
    static var psychicType = UIColor(hex: "#EA5D60")
    static var rockType = UIColor(hex: "#BAAB82")
    static var steelType = UIColor(hex: "#417D9A")
    static var waterType = UIColor(hex: "#4A90DA")
    
    static var bugTypeBackground = UIColor(red: 0.545, green: 0.839, blue: 0.455, alpha: 1)
    static var darkTypeBackground = UIColor(red: 0.435, green: 0.43, blue: 0.47, alpha: 1)
    static var dragonTypeBackground = UIColor(hexString: "7383B9")
    static var electricTypeBackground = UIColor(hexString: "F2CB55")
    static var fairyTypeBackground = UIColor(hexString: "EBA8C3")
    static var fightingTypeBackground = UIColor(hexString: "EB4971")
    static var fireTypeBackground = UIColor(red: 1, green: 0.655, blue: 0.337, alpha: 1)
    static var flyingTypeBackground = UIColor(hexString: "83A2E3")
    static var ghostTypeBackground = UIColor(hexString: "8571BE")
    static var grassTypeBackground = UIColor(red: 0.545, green: 0.745, blue: 0.541, alpha: 1)
    static var groundTypeBackground = UIColor(hexString: "F78551")
    static var iceTypeBackground = UIColor(hexString: "91D8DF")
    static var normalTypeBackground = UIColor(red: 0.709, green: 0.724, blue: 0.77, alpha: 1)
    static var poisonTypeBackground = UIColor(hexString: "9F6E97")
    static var psychicTypeBackground = UIColor(hexString: "FF6568")
    static var rockTypeBackground = UIColor(hexString: "D4C294")
    static var steelTypeBackground = UIColor(hexString: "4C91B2")
    static var waterTypeBackground = UIColor(red: 0.345, green: 0.671, blue: 0.965, alpha: 1)
    
    static var textField =  UIColor(red: 0.95, green:  0.95, blue:  0.95, alpha: 1)
    static var textColor = UIColor(red: 0.09, green: 0.09, blue: 0.106, alpha: 1)
    static var textNumber = UIColor(red: 0.09, green: 0.09, blue: 0.106, alpha: 0.6)
    static var backgroundGenerations = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
    static var textGenerations =  UIColor(red: 0.455, green: 0.455, blue: 0.463, alpha: 1)
    
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
    
    static func backgroundColor(colorString: ColorString) -> UIColor {
        switch colorString {
        
        case .bug:
            return UIColor.bugTypeBackground
        case .dark:
            return UIColor.darkTypeBackground
        case .dragon:
            return UIColor.dragonTypeBackground ?? .white
        case .electric:
            return UIColor.electricTypeBackground ?? .white
        case .fairy:
            return UIColor.fairyTypeBackground ?? .white
        case .fighting:
            return UIColor.fightingTypeBackground ?? .white
        case .fire:
            return UIColor.fireTypeBackground
        case .flying:
            return UIColor.flyingTypeBackground ?? .white
        case .ghost:
            return UIColor.ghostTypeBackground ?? .white
        case .grass:
            return UIColor.grassTypeBackground 
        case .ground:
            return UIColor.groundTypeBackground ?? .white
        case .ice:
            return UIColor.iceTypeBackground ?? .white
        case .normal:
            return UIColor.normalTypeBackground 
        case .poison:
            return UIColor.poisonTypeBackground ?? .white
        case .psychic:
            return UIColor.psychicTypeBackground ?? .white
        case .rock:
            return UIColor.rockTypeBackground ?? .white
        case .steel:
            return UIColor.steelTypeBackground ?? .white
        case .metal:
            return UIColor.white
        case .water:
            return UIColor.waterTypeBackground
        }
    }
}

enum ColorString: String  {
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case metal
    case water
}

extension UIColor {

  var hexString: String {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0

    getRed(&red, green: &green, blue: &blue, alpha: nil)

    return String(format: "#%02lX%02lX%02lX", lroundf(Float(red) * 255), lroundf(Float(green) * 255), lroundf(Float(blue) * 255))
  }

  convenience init?(hexString: String) {
    let colorString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "").uppercased()

    guard colorString.count == 6 else {
      return nil
    }

    var rgbValue: UInt32 = 0
    Scanner(string: colorString).scanHexInt32(&rgbValue)

    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: 1)
  }

}
