import SwiftUI


struct HomeView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case account
        case home
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ItemList()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(Tab.home)
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.circle.fill")
                }
                .tag(Tab.account)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AuthenticationModelData())
            .environmentObject(ItemModelData())
    }
}
