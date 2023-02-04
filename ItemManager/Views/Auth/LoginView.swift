import SwiftUI

struct LoginView: View {
    @EnvironmentObject var modelData: AuthenticationModelData
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to Item Manager")
                .fontWeight(.black)
                .foregroundColor(Color(.systemIndigo))
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            GoogleSignInButton()
                .padding()
                .onTapGesture {
                    modelData.signIn()
                }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
