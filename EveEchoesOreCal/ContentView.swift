//
//  ContentView.swift
//  iamrichswiftUI
//
//  Created by Javier Rendon on 5/29/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    var oreList = OreStruct()
    var playerLevel = PlayerOreProcessingLevel()
    var oreDictToUse: [String: String] = [:]
    
    @State private var selectedOre = "Veldspar"
    @State private var oreAmount: Int = 0
    @State private var oreType = "Normal"
    @State private var oreProcesslevel: Int = 0
    @State var keys: [String] = [""]
    @State var values: [String] = [""]
    
    var body: some View {
    

        
        ZStack {
            Image("galaxy")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("Ore Calculator")
                    .font(.title)
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                HStack {
                    Text(" Ore: ")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                    Picker("Pick an Ore", selection: $selectedOre) {
                        ForEach(oreList.oreList, id: \.self) {
                            Text($0)
                        }
                    }.tint(.white)
                    
                    
                    //Text(selectedOre)
                }.padding()
                HStack{
                    Text("Ore Type: ")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                    Picker("Ore Type", selection: $oreType){
                        ForEach(oreList.oreTypeList, id: \.self){
                            Text($0)
                        }
                    }.tint(.white)
                }.padding()
                
                HStack {
                    Text("Reprocess Level: ")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                    Picker("Reprocess Level", selection: $oreProcesslevel){
                        ForEach(playerLevel.playerLevelList, id: \.self){ num in
                            Text("\(num)").tag(num)
                        }
                    }.tint(.white)
                }.padding()
                
                HStack{
                    Text("Ore Amount: ")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                    TextField("Ore Amount", value: $oreAmount, formatter: NumberFormatter())
                        .background(.white)
                        .foregroundColor(.black)
                        .cornerRadius(25)
                        .frame(width: 100, alignment: .trailing)
                        .multilineTextAlignment(.center)
                    
                }.padding()
                Button("Calculate") {
                    
                    let oreStructToUse = oreDictSelection(oreName: selectedOre, oreType: oreType)
                    
                    var playerLevel = PlayerOreProcessingLevel()
                    let newMod = playerLevel.updatePlayerSkillLevel(level: oreProcesslevel)
                    
                    let oreDictToUse = oreStructToUse.updateDict(dict: oreStructToUse.oreDict, modifer: newMod, oreAmount: oreAmount, oreType: oreType)
                    
                    keys = oreDictToUse.map {$0.key}
                    values = oreDictToUse.map {$0.value}
                    
                }
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .buttonStyle(.bordered)
                .padding()
                
                VStack {
                    List(Array(zip(keys, values)), id: \.self.0) { (keys, values) in
                        Text("\(keys): \(values)")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .listRowBackground(Color.clear)
                            .font(.title)
                    }
                    
                    .background(.clear)
                    .scrollContentBackground(.hidden)
                    .foregroundColor(.white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

