import Foundation

struct OreStruct{
    
    var oreName: String = ""
    var oreDict: [String: Double] = [:]
    var oreType: String = ""
    var oreList: [String] = ["Veldspar", "Scordite", "Plagioclase", "Omber",
                             "Kernite", "Pyroxeres", "Dark Ochre", "Gneiss",
                             "Spodumain", "Hemorphite", "Hedbergite", "Jaspet",
                             "Crokite", "Bistot", "Arkonor", "Mercoxit"]
    var oreTypeList: [String] = ["Normal", "Rich", "Compressed"]
    
    func updateDict(dict: [String: Double], modifer: Double, oreAmount: Int, oreType: String) -> [String: String]{
        
        var mutatedDict = dict
        var newDict: [String: String] = [:]

        if oreType == "Normal"{
            for (key, value) in mutatedDict{
                mutatedDict[key] = (value * Double(oreAmount) * modifer) / 100
            }
        }
        else if oreType == "Compressed"{
            for (key, value) in mutatedDict{
                mutatedDict[key] = (value * Double(oreAmount) * modifer)
            }
        }
        else if oreType == "Rich"{
            for (key, value) in mutatedDict{
                mutatedDict[key] = (value * Double(oreAmount) * modifer) / 10
            }
        }
        else{
            print("Error")
        }
        
        for (key, value) in mutatedDict{
            let newValue = String(format: "%.2f",value)
            newDict[key] = newValue
        }
        return newDict
    }
}

func oreDictSelection(oreName: String, oreType: String) -> OreStruct{
    var tempOre = OreStruct()
    
    switch oreName {
    case "Veldspar":
        tempOre.oreDict = ["Tritanium": 4.15]
    case "Scordite":
        tempOre.oreDict = ["Tritanium": 1.62, "Pyerite": 1.15]
    case "Plagioclase":
        tempOre.oreDict = ["Trianium": 0.51, "Pyerite": 0.65, "Mexallon": 0.97]
    case "Pyroxeres":
        tempOre.oreDict = ["Tritanium": 17.55, "Pyerite": 5.60, "Mexallon": 2.50, "Nocxium": 0.30]
    case "Omber":
        tempOre.oreDict = ["Tritanium": 6.0, "Pyerite": 0.76, "Isogen": 0.55]
    case "Kernite":
        tempOre.oreDict = ["Tritanium": 2.66, "Mexallon": 4.80, "Isogen": 0.48]
    case "Dark Ochre":
        tempOre.oreDict = ["Tritanium": 9.60, "Isogen": 0.56, "Nocxium": 0.43]
    case "Spodumain":
        tempOre.oreDict = ["Tritanium": 197.00, "Pyerite": 37.40, "Mexallon": 3.60, "Isogen": 0.60]
    case "Gneiss":
        tempOre.oreDict = ["Pyerite": 8.80, "Mexallon": 92.0, "Isogen": 1.84]
    case "Hemorphite":
        tempOre.oreDict = ["Tritanium": 55.00, "Isogen": 1.60, "Nocxium": 0.13, "Zydrine": 0.50]
    case "Hedbergite":
        tempOre.oreDict = ["Pyerite": 27.3, "Isogen": 4.60, "Nocxium": 0.09, "Zydrine": 0.14]
    case "Jaspet":
        tempOre.oreDict = ["Mexallon": 24.60, "Nocxium": 0.48, "Zydrine": 0.56]
    case "Crokite":
        tempOre.oreDict = ["Tritanium": 388.00, "Nocxium": 0.94, "Zydrine": 0.96]
    case "Bistot":
        tempOre.oreDict = ["Pyerite": 61.20, "Zydrine": 0.36, "Megacyte": 0.79]
    case "Arkonor":
        tempOre.oreDict = ["Tritanium": 88.00, "Mexallon": 10.00, "Megacyte": 1.04]
    case "Mercoxit":
        tempOre.oreDict = ["Morphite": 0.60]
    default:
        return tempOre
    }
    return tempOre
}
