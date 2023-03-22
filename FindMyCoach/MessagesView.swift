import SwiftUI

struct MessagesView: View {
    var body: some View {
        NavigationStack{
            ZStack {
//                Color(.black)
                
                VStack(alignment: .leading){
                    
                    Text("Messages")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .offset(x: 10, y: 90)
                    
                    ZStack(alignment: .leading){
                        
                        Rectangle()
                            .cornerRadius(20)
                            .frame(width: 380, height: 550)
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading){
                            Spacer()
                            PersonneView(name: "Ernest", logo: "GigachadImage", category: "Coach")
                            Spacer()
                            PersonneView(name: "Thierry", logo: "GigachadImage", category: "Amis")
                            Spacer()
                            PersonneView(name: "Groupe TLS", logo: "GigachadImage", category: "Groupe")
                            Spacer()
                        }
                        .padding(25)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}


struct PersonneView: View {
    var name:String
    var logo:String
    var category:String
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text(category)
                .foregroundColor(.blue)
            
            NavigationLink{
                //Redirection vers Chat
                ChatView()
            } label: {
                ZStack(alignment: .leading){
                    Rectangle()
                        .frame(width: 300, height: 55)
                        .cornerRadius(25)
                        .foregroundColor(.black)
                    
                    
                    VStack(alignment: .leading){
                        HStack{
                            Image(logo)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(50)
                                .padding(5)
                            
                            Text(name)
                                .cornerRadius(20)
                                .bold()
                                .foregroundColor(.white)
                            
                        }
                    }
                }
            }
        }
    }
}
