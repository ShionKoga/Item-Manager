import SwiftUI
import FirebaseStorage

struct ItemImage: View {
    var itemId: String
    var cornerRadius: CGFloat
    @State var image: Image? = nil
    
    var body: some View {
        if image != nil {
            image!.resizable()
        } else {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.gray)
                .onAppear {
                    getImage()
                }
        }
    }
    
    private func getImage() {
        let imageRef = Storage.storage().reference().child("\(self.itemId).png")
        imageRef.getData(maxSize: .max) { data, error in
            if let error = error {
                print("image download error: \(error.localizedDescription)")
                return
            }
            
            let image = UIImage(data: data!)!
            self.image = Image(uiImage: image)
        }
    }
}

struct ItemImage_Previews: PreviewProvider {
    static var previews: some View {
        ItemImage(itemId: "", cornerRadius: 5)
    }
}
