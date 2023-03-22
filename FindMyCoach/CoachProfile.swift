import Foundation
import SwiftUI

struct CoachProfile: View {
    var coach = Coach(firstName: "Ernest", lastName: "Khalimov", age: 43, skills: "Bodybuilding coach", profilePicture: "GigachadImage", description: "I'm gigachad and I can help you becoming a better version of yourself", localization: "Toulouse", visioCoaching: true, irlCoaching: true, fares: 20, rating: 5.0)
    
    var body: some View {
        VStack {
            Image(coach.profilePicture)
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .padding([.leading, .bottom, .trailing])
            Text("\(coach.firstName) \(coach.lastName)")
                .padding([.leading, .bottom, .trailing])
            Text(coach.skills)
                .padding([.leading, .bottom, .trailing])
            if coach.irlCoaching == true {
                Text(coach.localization)
                    .padding([.leading, .bottom, .trailing])
            }
            if coach.visioCoaching == true {
                Text("Visio coaching")
                    .padding([.leading, .bottom, .trailing])
            }
            Text(coach.description)
                .padding(.bottom)
            Button {

            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 120, height: 50)
                        .foregroundColor(.red)
                        .cornerRadius(CGFloat(20))
                    HStack {
                        Text("Contact")
                            .foregroundColor(.black)
                    }
                }
                Spacer()
            }
        }
    }
}


struct CoachProfile_Previews: PreviewProvider {
    static var previews: some View {
        CoachProfile()
    }
}
