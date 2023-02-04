import SwiftUI

struct ItemList: View {
    @EnvironmentObject var itemModelData: ItemModelData
    @State private var showingAddNewItemSheet = false
    @State private var draftItem = Item.blank
    
    var body: some View {
        NavigationView {
            List {
                ForEach(itemModelData.items, id: \.id) { item in
                    NavigationLink {
                        ItemDetail(item: item)
                    } label: {
                        HStack {
                            item.image
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
                            draftItem = Item.blank
                        }
                        Spacer()
                        Button("save") {
                            showingAddNewItemSheet = false
                            itemModelData.addNew(item: draftItem)
                            draftItem = Item.blank
                        }
                    }
                    AddNewItem(item: $draftItem)
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
