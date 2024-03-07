//Player Skill
import Foundation

struct PlayerOreProcessingLevel{

    var basicprof: Double = 15.0
    var advanceprof: Double = 9.0
    var expertprof: Double = 7.5
    var baseMod: Double = 30.0
    var updatedMod: Double = 0.0
    var playerLevelList: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    var modifier: Int = 0
    
    mutating func updatePlayerSkillLevel(level: Int) -> Double {
        
        let newlevel = Double(level)
        
        if newlevel > 0 && newlevel < 6{
            switch newlevel{
                case 0:
                    modifier = 0
                case 1:
                    modifier = 10
                case 20:
                    modifier = 20
                case 3:
                    modifier = 30
                case 4:
                    modifier = 40
                case 5:
                    modifier = 50
                default:
                    modifier = 0
            }
            updatedMod = ((baseMod*Double(modifier))/100) + baseMod
        }
        else if newlevel > 5 && newlevel < 11{
            switch newlevel{
                case 6:
                    modifier = 10
                case 7:
                    modifier = 15
                case 8:
                    modifier = 20
                case 9:
                    modifier = 25
                case 10:
                    modifier = 30
                default:
                    modifier = 0
            }
            updatedMod = ((baseMod*Double(modifier))/100) + baseMod + basicprof
        }
        else if newlevel > 10 && newlevel < 16{
            switch newlevel{
                case 6:
                    modifier = 5
                case 7:
                    modifier = 10
                case 8:
                    modifier = 15
                case 9:
                    modifier = 20
                case 10:
                    modifier = 25
                default:
                    modifier = 0
            }
            updatedMod = ((baseMod*Double(modifier))/100) + baseMod + basicprof
        }
        else{
            updatedMod = baseMod
        }
        return updatedMod
    }
}

