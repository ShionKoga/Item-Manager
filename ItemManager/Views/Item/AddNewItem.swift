import SwiftUI

struct AddNewItem: View {
    @Binding var draftItem: Item
    @Binding var selectedImage: UIImage?
    @Binding var showing: Bool
    @State private var displayImagePicker = false
    @EnvironmentObject var itemModelData: ItemModelData
    
    var body: some View {
        NavigationView {
            VStack {
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 300)
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.gray)
                            .frame(maxHeight: 300)
                        
                        Button {
                            self.displayImagePicker.toggle()
                        } label: {
                            Image(systemName: "camera.on.rectangle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .foregroundColor(.black)
                        }
                    }
                }
                
                TextField("Name", text: $draftItem.name)
                    .frame(height: 50)
                Divider()
                
                TextField("Description", text: $draftItem.description)
                    .frame(height: 50)
                Divider()

                Spacer()
                
                Button {
                    saveItem()
                    dismiss()
                } label: {
                    Text("Save Item")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemIndigo))
                        .cornerRadius(12)
                        .padding()
                }
            }
            .navigationTitle("Add new item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
            .fullScreenCover(isPresented: $displayImagePicker) {
                ImagePickerView(isPresented: $displayImagePicker, selectedImage: $selectedImage)
                    .ignoresSafeArea()
            }
            .padding()
        }
    }
    
    private func dismiss() {
        showing = false
        draftItem = Item(name: "", description: "")
    }
    
    private func saveItem() {
        itemModelData.addNew(
            name: draftItem.name,
            description: draftItem.description,
            image: selectedImage?.pngData()
        )
    }
}

struct AddNewItem_Previews: PreviewProvider {
    static var previews: some View {
        AddNewItem(
            draftItem: .constant(Item(name: "", description: "")),
            selectedImage: .constant(nil),
            showing: .constant(true)
        )
    }
}
