import Foundation
import SwiftUI
import FirebaseDatabase
import CodableFirebase
import FirebaseStorage


final class ItemModelData: ObservableObject {
    @Published var items = [Item]()
    private var databaseRef: DatabaseReference!
    private var storageRef: StorageReference!
    
    init() {
        self.databaseRef = Database.database().reference().child("items")
        self.storageRef = Storage.storage().reference()
        self.fetchItems()
    }
    
    private func fetchItems(completion: @escaping () -> Void = {}) {
        self.databaseRef.getData() { error, snapshot in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let value = snapshot?.value else { return }
            if value is NSNull {
                self.items = []
                completion()
            } else {
                guard let items = try? FirebaseDecoder().decode([Item].self, from: value) else { return }
                
                self.items = items
                completion()
            }
        }
    }
    
    private func pushItems(completion: @escaping () -> Void = {}) {
        guard let data = try? FirebaseEncoder().encode(items) else { return }
        self.databaseRef.setValue(data, withCompletionBlock: { error, ref in
            completion()
        })
    }
    
    private func saveImage(path: String, imageData: Data?, onSuccess: @escaping () -> Void) {
        guard let imageData = imageData else { return }
        
        let ref = storageRef.child(path)
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        
        let uploadTask = ref.putData(imageData, metadata: metaData)
        uploadTask.observe(.success) { _ in
            onSuccess()
        }
    }
    
    func addNew(name: String, description: String, image: Data?) {
        let item = Item(name: name, description: description)
        
        saveImage(path: "\(item.id).png", imageData: image) {
            self.fetchItems() {
                self.items.append(item)
                self.pushItems() {
                    print("save finished")
                }
            }
        }
    }
}
