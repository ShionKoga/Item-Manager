import SwiftUI

struct ItemDetail: View {
    var item: Item
    
    var body: some View {
        VStack {
            item.image
            Text(item.description)
            List {
                ForEach(0..<item.borrowers.count) { index in
                    Text(item.borrowers[index])
                }
            }
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
