import Foundation
import SwiftUI

struct Item: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
}
