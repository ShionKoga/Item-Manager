import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
    
    func makeUIViewController(
        context: Context
    ) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(
        _ uiViewController: UIImagePickerController,
        context: Context
    ) {
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var picker: ImagePickerView
        
        init(picker: ImagePickerView) {
            self.picker = picker
        }
        
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            guard let selectedImage = info[.originalImage] as? UIImage else { return }
            self.picker.selectedImage = selectedImage
            self.picker.isPresented.toggle()
        }
    }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(isPresented: .constant(false), selectedImage: .constant(nil))
    }
}
