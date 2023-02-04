import SwiftUI

struct ItemDetail: View {
    var item: Item
    
    var body: some View {
        VStack {
            Image("monitor")
            Text(item.description)
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: ItemModelData().items[0])
    }
}
