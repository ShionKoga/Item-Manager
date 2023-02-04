import SwiftUI
import FirebaseCore

@main
struct ItemManagerApp: App {
    @StateObject var itemModelData = ItemModelData()
    @StateObject var authModelData = AuthenticationModelData()
    
    init() {
        setupAnthentication()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(itemModelData)
                .environmentObject(authModelData)
        }
    }
}

extension ItemManagerApp {
    private func setupAnthentication() {
        FirebaseApp.configure()
    }
}
