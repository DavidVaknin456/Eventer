//
//  SettingsView.swift
//  Eventer
//
//  Created by David Vaknin on 18/06/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
                    List {
                        Text("First")
                        Text("Second")
                        Text("Third")
                        Text("Fourth")
                        Text("Fifth")
                        Text("Sixth")
                        Text("Seventh")
                        Text("Eighth")
                        Text("Ninth")
                        Text("Tenth")
                    }.font(.largeTitle)
                }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
