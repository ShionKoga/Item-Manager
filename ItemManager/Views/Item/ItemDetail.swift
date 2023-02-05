import SwiftUI
import FirebaseStorage

struct ItemDetail: View {
    var item: Item
    
    var body: some View {
        VStack {
            ItemImage(itemId: item.id.uuidString, cornerRadius: 10)
                .aspectRatio(contentMode: .fit)
            Text(item.description)
        }
        .padding()
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: Item(name: "hoge", description: "hogehoge"))
    }
}
