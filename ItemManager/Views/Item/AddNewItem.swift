import SwiftUI

struct AddNewItem: View {
    @Binding var item: Item
    
    var body: some View {
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
        
        Spacer()
    }
}

struct AddNewItem_Previews: PreviewProvider {
    static var previews: some View {
        AddNewItem(item: .constant(Item(name: "pc monitor", description: "pcMonitor 01")))
    }
}
