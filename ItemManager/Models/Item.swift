import Foundation
import SwiftUI
import FirebaseStorage

struct Item: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var description: String
}
