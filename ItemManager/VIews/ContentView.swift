import SwiftUI

struct ContentView: View {
    var body: some View {
        ItemList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ItemModelData())
    }
}
