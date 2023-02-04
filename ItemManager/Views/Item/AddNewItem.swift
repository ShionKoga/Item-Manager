import SwiftUI

struct AddNewItem: View {
    @Binding var item: Item
    
    @Binding var selectedImage: UIImage?
    @State private var displayImagePicker = false
    
    var body: some View {
        VStack {
            Text("Add new item")
                .font(.title)
                .bold()
                .padding(.top, 10)
            
            Divider()
            
            HStack {
                Text("Name").bold()
                Divider()
                TextField("Name", text: $item.name)
            }
            .frame(height: 50)
            
            Divider()
            
            HStack {
                Text("Description").bold()
                Divider()
                TextField("Description", text: $item.description)
            }
            .frame(height: 50)
            
            Divider()
            
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 300)
            } else {
                Image(systemName: "snow")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 300)
            }
            
            Button {
                self.displayImagePicker.toggle()
            } label: {
                Text("Take Photo")
            }
            
            Spacer()
        }
        .fullScreenCover(isPresented: $displayImagePicker) {
            ImagePickerView(isPresented: $displayImagePicker, selectedImage: $selectedImage)
                .ignoresSafeArea()
        }
    }
}

struct AddNewItem_Previews: PreviewProvider {
    static var previews: some View {
        AddNewItem(
            item: .constant(Item(name: "pc monitor", description: "pcMonitor 01")),
            selectedImage: .constant(nil)
        )
    }
}
