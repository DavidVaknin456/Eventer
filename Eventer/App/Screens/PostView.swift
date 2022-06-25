//
//  PostView.swift
//  Eventer
//
//  Created by David Vaknin on 21/06/2022.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        NavigationView {
            Text("Post")
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
                            Button(action: {}) {
                                    HStack {
                                        Image(systemName: "line.3.horizontal.decrease.circle")
                                    }
                                }
                                .hidden()
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

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
