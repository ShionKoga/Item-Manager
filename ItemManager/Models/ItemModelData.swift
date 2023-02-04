import Foundation
import SwiftUI

final class ItemModelData: ObservableObject {
    @Published var items: [Item] = [
        Item(
            name: "monitor 01",
            description: "PC Monitor 01",
            borrowers: ["Shion"]
        )
    ]
    
    func addNew(item: Item) {
        items.append(item)
    }
}
