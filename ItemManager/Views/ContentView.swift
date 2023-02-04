import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authModelData: AuthenticationModelData
    
    var body: some View {
        switch authModelData.state {
        case .signedIn: HomeView()
        case .signedOut: LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthenticationModelData())
    }
}
