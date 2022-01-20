//
//  TipsList.swift
//  TrekrMultiPlatform
//
//  Created by Harris-Stoertz, Rowan on 2022-01-19.
//

import SwiftUI

struct TipsList: View {
    
    //this view creates its own source of truth
    let tips: [Tip]
    
    var body: some View {
        List(tips, id: \.text, children: \.children) { tip in
            
            //if there are children on this particular tip...
            if tip.children != nil {
                Label(tip.text, systemImage: "quote.bubble")
            } else {
                Text(tip.text)
            }
        }
    }
    
    //initializer pulls tips data from JSON
    //populates the array
    init() {
        
        //get a pointer to the file
        let url = Bundle.main.url(forResource: "tips", withExtension: "json")!
        
        //load the contents of the json file
        let data = try! Data(contentsOf: url)
        
        //convert the data from the JSON file into the array
        tips = try! JSONDecoder().decode([Tip].self, from: data)
    }
}

struct TipsList_Previews: PreviewProvider {
    static var previews: some View {
        TipsList()
    }
}
