//
//  ContentView.swift
//  FinalProject60
//
//  Created by Margarita Mayer on 21/01/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query private var users: [User]
    
    @State private var path = NavigationPath()
    
    @State private var dataLoaded = false
    
    var body: some View {
        NavigationStack(path: $path) {
            
            if dataLoaded {
                
                List(users, id: \.id) { user in
                    NavigationLink(value: user) {
                        
                        VStack(alignment: .leading) {
                            
                            Text(user.name)
                            
                            Text(user.isActive ? "User is active" : "User is not active")
                        }
                    }
                }
                .navigationDestination(for: User.self) { user in
                    DetailView(user: user, path: $path)
                }
                
            } else {
                Text("Data is loading")
            }
        
    }
        .onAppear {
            
            Task {
                await loadData()
            }
        }
        
}
    
    func loadData() async {
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
           
            let (data, _) = try await URLSession.shared.data(from: url)
            
            do {
                let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                
                try modelContext.delete(model: User.self)
                
                for user in decodedUsers {
                    modelContext.insert(user)
                }
                
                dataLoaded.toggle()
                
            } catch  let decodingError {
                print("\(decodingError)")
            }
               
            
                
        } catch {
            print("Invalid data: \(error.localizedDescription)")
        }
        
        
    }
}

#Preview {
    ContentView()
}
