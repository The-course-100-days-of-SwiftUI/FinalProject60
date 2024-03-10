//
//  DetailView.swift
//  FinalProject60
//
//  Created by Margarita Mayer on 21/01/24.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    
    var user: User
    
    @Query var users: [User]
    
    @Binding var path: NavigationPath

    var body: some View {
        List {
            
            Text(user.name)
                .font(.headline)
            Text(String(user.age))
                .foregroundStyle(.secondary)
            Text(user.address)
            Text(user.email)
            Text(user.company)
            Text(user.about)
            
            Section {
                Text("\(user.name) has friends:")
                ForEach(user.friends, id: \.id) { friend in
                    Button("\(friend.name)") {
                        path = NavigationPath([
                            users.first(where: {$0.id == friend.id})!
                        ])
                    }
                }
            }
            
            
            
            
        }
    }
}

//#Preview {
//    DetailView(user: User())
//}
