import SwiftUI
import GoogleSignIn

struct AccountView: View {
    @EnvironmentObject var modelData: AuthenticationModelData
    
    private let user = GIDSignIn.sharedInstance.currentUser
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    UserImage(url: user?.profile?.imageURL(withDimension: 200))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(8)
                    VStack {
                        Text(user?.profile?.name ?? "")
                            .font(.headline)
                        Text(user?.profile?.email ?? "")
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .padding()
                
                Spacer()
                
                Button(action: modelData.signOut) {
                    Text("Sign out")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemIndigo))
                        .cornerRadius(12)
                        .padding()
                }
            }
            .navigationTitle("Item Manager")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(AuthenticationModelData())
    }
}
