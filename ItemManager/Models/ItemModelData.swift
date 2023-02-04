import Foundation
import SwiftUI
import FirebaseDatabase
import CodableFirebase

final class ItemModelData: ObservableObject {
    @Published var items = [Item]()
    private var ref: DatabaseReference!
    
    init() {
        self.ref = Database.database().reference().child("items")
        self.ref.observe(DataEventType.value) { snapshot  in
            guard let value = snapshot.value else { return }
            do {
                let items = try FirebaseDecoder().decode([Item].self, from: value)
                self.items = items
            } catch {
                print("Fatal error: faild to decode items")
            }
        }
    }
    
    func addNew(item: Item) {
        items.append(item)
        guard let data = try? FirebaseEncoder().encode(items) else { return }
        ref.setValue(data)
    }
}
