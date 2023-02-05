import SwiftUI

struct UserImage: View {
    let url: URL?
    @State var image: Image? = nil
    
    var body: some View {
        if let image = image {
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
        } else {
          Image(systemName: "person.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onAppear {
                getImage()
            }
        }
    }
    
    private func getImage() {
        guard let url = url else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            let uiImage = UIImage(data: data)!
            self.image = Image(uiImage: uiImage)
        }.resume()
    }
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
        UserImage(url: nil)
    }
}
