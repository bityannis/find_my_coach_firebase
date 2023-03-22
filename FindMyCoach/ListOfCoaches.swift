import Foundation
import SwiftUI

struct ListOfCoaches: View {
    var body: some View {
        NavigationStack {
//            ScrollView {
                VStack(alignment: .leading) {
            List(coaches){ coach in
                NavigationLink(destination: CoachProfile(coach: coach)) {
                    VStack {
                        HStack {
                            Image(coach.profilePicture)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 50)
//                                .padding()
                            Text(coach.firstName)
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                                .navigationTitle("All Coaches")
                                .padding()
//                            Spacer()
                        }
//                        Divider()
                    }
                            }
                        }
                    }
//            }
        }
    }
}

struct ListOfCoaches_Previews: PreviewProvider {
    static var previews: some View {
        ListOfCoaches()
    }
}

var coaches = [
    Coach(firstName: "Ernest", lastName: "Khalimov", age: 43, skills: "Bodybuilding coach", profilePicture: "GigachadImage", description: "I'm gigachad and I can help you becoming a better version of yourself", localization: "Toulouse", visioCoaching: true, irlCoaching: true, fares: 20, rating: 5.0),
    Coach(firstName: "Brian", lastName: "Shaw", age: 39, skills: "Strongman coach", profilePicture: "BrianShawImage", description: "I'm a 4-time World's Strongest Man champion and I can help you become a better strongman competitor", localization: "Colorado", visioCoaching: true, irlCoaching: true, fares: 100, rating: 4.9),
    Coach(firstName: "Ronnie", lastName: "Coleman", age: 57, skills: "Bodybuilding coach", profilePicture: "BlondChad", description: "I'm an 8-time Mr. Olympia champion and I can help you achieve your bodybuilding goals", localization: "Texas", visioCoaching: true, irlCoaching: true, fares: 150, rating: 4.8),
    Coach(firstName: "Adam", lastName: "Ondra", age: 28, skills: "Rock climbing coach", profilePicture: "AdamOndraFace", description: "I'm a world-renowned rock climber and I can help you improve your climbing skills", localization: "Czech Republic", visioCoaching: true, irlCoaching: false, fares: 75, rating: 4.7),
    Coach(firstName: "Mike", lastName: "Tyson", age: 55, skills: "Boxing coach", profilePicture: "MikeTysonImage", description: "I'm a former heavyweight champion and I can teach you the art of boxing", localization: "Nevada", visioCoaching: true, irlCoaching: true, fares: 200, rating: 4.9)
]
