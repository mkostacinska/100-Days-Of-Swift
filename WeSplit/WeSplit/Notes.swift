//
//  Notes.swift
//  WeSplit
//
//  Created by Maja Kostacinska on 15/08/2022.
//

import SwiftUI

//MARK: A COLLECTION OF NOTES UNRELATED TO THE ACTUAL PROJECT

//NOTES:
//you can have up to 10 things in one component - if more, you need to group them - this limit of 10 children inside a parent applies everywhere in swift
//Groups do not change the visuals of your form (or other component), they just allow us to work around the 10-children limitation
//Sections, however, visually affect the view - you can distinguish between sections
//In order to add a navigation bar to the view, we need to wrap the contents inside NaviagtionView - it has a top navigation bar to which you can add a title
//State is the active collection of things decribing how the (struct) is right now
//@State variables are stored separately in a place that can be modified - therefore, they work around the struct limitation of immutable vaariables



//creates a new struct called ContentView, conforming to the View protocol
struct Notes: View {
    @State private var count: Int = 0 //the @State makes the var modifiable (Apple recommends to keep them private)
    @State private var name: String = ""
    
    //new computed variable called body which is of type that conforms to view
    var body: some View {
        //for views that require some user input, use forms:
        NavigationView{
            Form{
                Text("Hello, world!")
                    .padding()
                Button("Increase: \(count)"){
                    count+=1
                }
                TextField("Please add your name", text: $name) //we need to make it binding so that it changes the state variable when the text updates (two way binding)
                
                //creating swift views inside a loop:
                ForEach(0..<10){ number in
                    Text("Current number: \(number)")
                }
                //...or, with shorthand syntax
                ForEach(0..<2){
                    Text("The number: \($0)")
                }
                
                //this is extremely useful in (e.g.) defining your own pickers
                
            }
        }.navigationTitle("NavigationTitle") //adding a navigation title to the navigation bar
            .navigationBarTitleDisplayMode(.inline) //makes the title's font small
    }
}

//this is only for canvas preview purposes
struct Notes_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
