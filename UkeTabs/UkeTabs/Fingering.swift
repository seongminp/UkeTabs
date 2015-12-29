//
//  Fingering.swift
//  UkeTabs
//
//  Created by Seongmin on 12/6/15.
//  Copyright © 2015 Seongmin. All rights reserved.
//

import UIKit

class Fingering {
    var name = ""
    var value = ""
    var indices: [Int] = []
    
    // Static variables (official fingerings)
    static let c = Fingering(nameInfo: "C",indicesInfo: [11])
    static let d = Fingering(nameInfo: "D",indicesInfo: [4,5,6])
    static let e = Fingering(nameInfo: "E",indicesInfo: [7,12,13,14])
    static let f = Fingering(nameInfo: "F",indicesInfo: [2,4])
    static let g = Fingering(nameInfo: "G",indicesInfo: [5,7,10])
    static let a = Fingering(nameInfo: "A",indicesInfo: [1,4])
    static let b = Fingering(nameInfo: "B",indicesInfo: [6,7,9,12])
    static let cm = Fingering(nameInfo: "Cm",indicesInfo: [9,10,11])
    static let dm = Fingering(nameInfo: "Dm",indicesInfo: [2,4,5])
    static let em = Fingering(nameInfo: "Em",indicesInfo: [7,10,13])
    static let fm = Fingering(nameInfo: "Fm",indicesInfo: [0,2,11])
    static let gm = Fingering(nameInfo: "Gm",indicesInfo: [3,5,10])
    static let am = Fingering(nameInfo: "Am",indicesInfo: [4])
    static let bm = Fingering(nameInfo: "Bm",indicesInfo: [5,6,7,12])
    static let c7 = Fingering(nameInfo: "C7",indicesInfo: [3])
    static let d7 = Fingering(nameInfo: "D7",indicesInfo: [4,6])
    static let e7 = Fingering(nameInfo: "E7",indicesInfo: [5,7])
    static let f7 = Fingering(nameInfo: "F7",indicesInfo: [2,4,9])
    static let g7 = Fingering(nameInfo: "G7",indicesInfo: [2,5,7])
    static let a7 = Fingering(nameInfo: "A7",indicesInfo: [1])
    static let b7 = Fingering(nameInfo: "B7",indicesInfo: [4,6,7,9])
    static let cmaj7 = Fingering(nameInfo: "Cmaj7",indicesInfo: [7])
    static let dmaj7 = Fingering(nameInfo: "Dmaj7",indicesInfo: [4,5,6,15])
    static let emaj7 = Fingering(nameInfo: "Emaj7",indicesInfo: [0,7,9])
    static let fmaj7 = Fingering(nameInfo: "Fmaj7",indicesInfo: [2,4,11,13])
    static let gmaj7 = Fingering(nameInfo: "Gmaj7",indicesInfo: [5,6,7])
    static let amaj7 = Fingering(nameInfo: "Amaj7",indicesInfo: [0,1])
    static let bmaj7 = Fingering(nameInfo: "Bmaj7",indicesInfo: [6,7,8,9])
    static let cm7 = Fingering(nameInfo: "Cm7",indicesInfo: [8,9,10,11])
    static let dm7 = Fingering(nameInfo: "Dm7",indicesInfo: [2,4,5,11])
    static let em7 = Fingering(nameInfo: "Em7",indicesInfo: [5,7]) // Dont know why this is a duplicate of E7.
    static let fm7 = Fingering(nameInfo: "Fm7",indicesInfo: [0,2,9,11])
    static let gm7 = Fingering(nameInfo: "Gm7",indicesInfo: [2,3,5])
    static let am7 = Fingering(nameInfo: "Am7",indicesInfo: [10,11,13])
    static let bm7 = Fingering(nameInfo: "Bm7",indicesInfo: [4,5,6,7])
    
    static let fingerings: [Fingering] = [c,d,e,f,g,a,b,
                                          cm,dm,em,fm,gm,am,bm,
                                          c7,d7,e7,f7,g7,a7,b7,
                                          cmaj7,dmaj7,emaj7,fmaj7,gmaj7,amaj7,bmaj7,
                                          cm7,dm7,em7,fm7,gm7,am7,bm7]
    
    init(nameInfo: String, indicesInfo: [Int]) {
        name = nameInfo
        indices = indicesInfo
        value = toString()
    }
    
    func toString() -> String {
        var toReturn = ""
        for int in indices {
            toReturn += String(int)
        }
        return toReturn
    }
    
    static func isValid(toVerify: String) -> String {
        for fingering in fingerings {
            if (fingering.value == toVerify) {
                return fingering.name
            }
        }
        return "None"
    }

}
