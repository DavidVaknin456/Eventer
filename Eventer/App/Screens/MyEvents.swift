//
//  MyEvents.swift
//  Eventer
//
//  Created by David Vaknin on 21/06/2022.
//

import SwiftUI

struct MyEvents: View {
    var body: some View {
        NavigationView { // <1>
            Text("My Events")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar { // <2>
                    ToolbarItem(placement: .principal) { // <3>
                        HStack {
                            Button(action: {
                                    print("Profile tapped!")
                                }) {
                                    HStack {
                                        Image(systemName: "person.crop.circle")
                                    }
                                }
                            Button(action: {}) {
                                    HStack {
                                        Image(systemName: "line.3.horizontal.decrease.circle")
                                    }
                                }
                                .hidden()
                            Text("Eventush")
                                .font(
                                    .title
                                    .weight(.bold)
                                )
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity)
                            Button(action: {
                                    print("Add Event tapped!")
                                }) {
                                    HStack {
                                        Image(systemName: "plus.circle")
                                    }
                                }
                            Button(action: {
                                    print("Filter tapped!")
                                }) {
                                    HStack {
                                        Image(systemName: "line.3.horizontal.decrease.circle")
                                    }
                                }
                        }

                    }
                }
        }
    }
}

struct MyEvents_Previews: PreviewProvider {
    static var previews: some View {
        MyEvents()
    }
}
