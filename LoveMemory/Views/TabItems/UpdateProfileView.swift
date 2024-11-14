import SwiftUI

struct UpdateProfileView: View {
    @State var email: String = ""
    @State var name: String = ""
    
    var body: some View {
        VStack {
            TextField("名前を入力", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
            
            Button(action: {
                        
                    }) {
                        Text("更新")
                    }
        }
    }
}

#Preview {
    UpdateProfileView()
}
