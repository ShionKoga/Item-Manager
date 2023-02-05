import SwiftUI

struct ItemList: View {
    @EnvironmentObject var itemModelData: ItemModelData
    @State private var showingAddNewItemSheet = false
    @State private var draftItem = Item(name: "", description: "")
    @State private var selectedImage: UIImage? = nil
    @State private var path = [Item]()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(itemModelData.items, id: \.id) { item in
                    Button {
                        path.append(item)
                    } label: {
                        HStack {
                            ItemImage(itemId: item.id.uuidString, cornerRadius: 5)
                                .frame(width: 50, height: 50)
                            Text(item.name)
                        }
                    }
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                }
            }
            .navigationDestination(for: Item.self) { item in
                ItemDetail(item: item)
            }
            .navigationTitle("Items")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            showingAddNewItemSheet.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("Add New Item")
                            }
                        }
                        Spacer()
                    }
                }
            }
            .fullScreenCover(isPresented: $showingAddNewItemSheet) {
                AddNewItem(
                    draftItem: $draftItem,
                    selectedImage: $selectedImage,
                    showing: $showingAddNewItemSheet
                )
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
