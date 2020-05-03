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
    static var grassType = UIColor(hex: "#62B957")
    static var groundType = UIColor(hex: "#DD7748")
    static var iceType = UIColor(hex: "#61CEC0")
    static var normalType = UIColor(hex: "#9DA0AA")
    static var poisonType = UIColor(hex: "#A552CC")
    static var psychicType = UIColor(hex: "#EA5D60")
    static var rockType = UIColor(hex: "#BAAB82")
    static var steelType = UIColor(hex: "#417D9A")
    static var waterType = UIColor(hex: "#4A90DA")
    
    static var bugTypeBackground = UIColor(hex: "#8BD674")
    static var darkTypeBackground = UIColor(hex: "#6F6E78")
    static var dragonTypeBackground = UIColor(hex: "#7383B9")
    static var electricTypeBackground = UIColor(hex: "#F2CB55")
    static var fairyTypeBackground = UIColor(hex: "#EBA8C3")
    static var fightingTypeBackground = UIColor(hex: "#EB4971")
    static var fireTypeBackground = UIColor(hex: "#FFA756")
    static var flyingTypeBackground = UIColor(hex: "#83A2E3")
    static var ghostTypeBackground = UIColor(hex: "#8571BE")
    static var grassTypeBackground = UIColor(hex: "#8BBE8A")
    static var groundTypeBackground = UIColor(hex: "#F78551")
    static var iceTypeBackground = UIColor(hex: "#91D8DF")
    static var normalTypeBackground = UIColor(hex: "#B5B9C4")
    static var poisonTypeBackground = UIColor(hex: "#9F6E97")
    static var psychicTypeBackground = UIColor(hex: "#FF6568")
    static var rockTypeBackground = UIColor(hex: "#D4C294")
    static var steelTypeBackground = UIColor(hex: "#4C91B2")
    static var waterTypeBackground = UIColor(hex: "#58ABF6")
    
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
}
