import Foundation
import SwiftUI
import FirebaseStorage

struct Item: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
}

//struct Item {
//    var id: UUID
//    var name: String
//    var description: String
//    @State var imageUrl: URL? = nil
//
//    init(id: UUID, name: String, description: String) {
//        self.id = id
//        self.name = name
//        self.description = description
//        self.getImageUrl()
//    }
//
//    private func getImageUrl() {
//        let imageRef = Storage.storage().reference().child("\(self.id).png")
//        imageRef.downloadURL { url, error in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//            print("no error")
//            guard let url = url else { return }
//            print(url)
//            self.imageUrl = url
//        }
//    }
//}
