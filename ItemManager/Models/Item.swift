import Foundation
import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var image: Image = Image("monitor")
    var borrowers: [String]
    
    static let `blank` = Item(name: "", description: "", borrowers: [])
}
