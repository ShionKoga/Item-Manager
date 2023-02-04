import SwiftUI

struct ItemList: View {
    @EnvironmentObject var itemModelData: ItemModelData
    @State private var showingAddNewItemSheet = false
    @State private var draftItem = Item(name: "", description: "")
    @State private var selectedImage: UIImage? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(itemModelData.items, id: \.id) { item in
                    NavigationLink {
                        ItemDetail(item: item)
                    } label: {
                        HStack {
                            Image("monitor")
                                .resizable()
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
                            draftItem = Item(name: "", description: "")
                        }
                        Spacer()
                        Button("save") {
                            showingAddNewItemSheet = false
                            itemModelData.addNew(item: draftItem, image: selectedImage?.pngData())
                            draftItem = Item(name: "", description: "")
                        }
                    }
                    AddNewItem(item: $draftItem, selectedImage: $selectedImage)
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
