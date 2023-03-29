//
//  ChatView.swift
//  FireBase
//
//  Created by Yannis Kessas on 28/03/2023.
//

import SwiftUI
import Firebase

struct ChatView: View {
    @State var isLoggedOut: Bool = false
    @State var message: String = ""
    let db = Firestore.firestore()
    @State var messages: [Message] = []
    @State var messageColor: Color = .white
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    init() {
           getMessages()
       }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            isLoggedOut = true
            print("logged out successfully")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func sendMessage() {
        let messageBody = message
        let messageSender = Auth.auth().currentUser?.email
        
        var ref: DocumentReference? = nil
        ref = db.collection("messages").addDocument(data: [
            "message": messageBody,
            "sender": messageSender,
            "date": Date().timeIntervalSince1970
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                ref!.getDocument {
                    (document, error) in
                    if let document = document, document.exists {
                        let data = document.data()
                        print("DATA is \(data!)")
//                        if Auth.auth().currentUser?.email! == messageSender {
//                            messageColor = .blue
//                        } else {
//                            print("No user is signed in")
//                            messageColor = .red
//                        }
                    }
                }
                
            }
        }
        getMessages()
        
    }
    
    func getMessages() {
        messages.removeAll()
        let messageSender = Auth.auth().currentUser?.email
        if (messageSender != nil) {
            db.collection("messages").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let message = document.data()
                        let messageText = message["message"] as? String ?? ""
                        let messageSender = message["sender"] as? String ?? ""
                        let messageDate = message["date"] as? Double ?? 0.0
                        messages.append(Message(sender: messageSender, body: messageText, date: messageDate))
                    }
                    messages.sorted { m1, m2 in
                        m1.date < m2.date
                    }
                }
            }
        }
    }
    var body: some View {
        NavigationStack {
            VStack {
//                HStack {
//                    NavigationLink(destination: WelcomeView().navigationBarHidden(true), isActive: $isLoggedOut) {
//                        Button("Log Out") {
//                            logOut()
//                        }.fontWeight(.bold).foregroundColor(.purple)
//                    }
//                }.padding()
                
                ForEach(messages) { message in
                    VStack {
                        HStack {
                            Text(message.body).background(messageColor).padding()
                            Text(message.sender)
                                .font(.footnote)
                        }
                        
                    }
//                    .onReceive(timer) { _ in
//                       // Call your function here
//                       getMessages()
//                   }
                }
                Spacer()
                
                HStack {
                    TextField("Message", text: $message)
                    Button {
                        sendMessage()
                    } label: {
                        Text("Send").padding()
                    }
                }.padding()
            }
        }
        .onAppear {
            getMessages()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
