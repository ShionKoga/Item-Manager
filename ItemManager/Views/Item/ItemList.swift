import SwiftUI

struct ItemList: View {
    @EnvironmentObject var itemModelData: ItemModelData
    @State private var showingAddNewItemSheet = false
    @State private var draftItemName = ""
    @State private var draftItemDescription = ""
    @State private var selectedImage: UIImage? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(itemModelData.items, id: \.id) { item in
                    NavigationLink {
                        ItemDetail(item: item)
                    } label: {
                        HStack {
                            ItemImage(itemId: item.id.uuidString)
                                .frame(width: 50, height: 50)
                            Text(item.name)
                        }
                    }
                }
            }
            .navigationTitle("Items")
            .toolbar {
                Button {
                    showingAddNewItemSheet.toggle()
                } label: {
                    Label("Add new Item", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddNewItemSheet) {
                VStack(alignment: .leading) {
                    HStack {
                        Button("cancel") {
                            showingAddNewItemSheet = false
                            draftItemName = ""
                            draftItemDescription = ""
                        }
                        Spacer()
                        Button("save") {
                            showingAddNewItemSheet = false
                            itemModelData.addNew(name: draftItemName, description: draftItemDescription, image: selectedImage?.pngData())
                            draftItemName = ""
                            draftItemDescription = ""
                        }
                    }
                    AddNewItem(itemName: $draftItemName, itemDescription: $draftItemDescription, selectedImage: $selectedImage)
                }
                .padding()
            }
        }
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList()
            .environmentObject(ItemModelData())
    }
}
