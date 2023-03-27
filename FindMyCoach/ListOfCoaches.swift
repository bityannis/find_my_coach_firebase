import Foundation
import SwiftUI
struct CustomColor {
    static let lightGray = Color("lightGray")
}

struct ListOfCoaches: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
            ForEach(coaches){ coach in
                NavigationLink(destination: CoachProfile(coach: coach)) {
                    VStack {
                        ZStack {
                            Rectangle()
                                .cornerRadius(30)
                                .foregroundColor(CustomColor.lightGray)
                        HStack {
                            Image(coach.profilePicture)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 80)
                                .padding(.horizontal)
                            VStack {
                                HStack {
                                    Text("\(coach.firstName) \(coach.lastName)")
                                        .font(.system(size: 25))
                                        .foregroundColor(.black)
                                        .frame(alignment: .leading)
                                        .navigationTitle("All Coaches")
                                    Spacer()
                                }
                                HStack {
                                    if coach.userRatings.count == 0 {
                                        
                                        Text("No ratings yet")
                                            .foregroundColor(.gray)
                                            .padding(.bottom, 36)
                                    } else {
                                        FiveStarView(rating: Decimal(coach.average()))
                                            .scaleEffect(0.5)
                                            .frame(width: 40, height: 40)
                                            .offset(x: 40, y: -20)
                                    }
                                    Spacer()
                                }
                                HStack {
                                    Text(coach.skills)
                                        .foregroundColor(.black)
                                        .offset(x: 0, y: -20)
                                    Spacer()
                                }
                            }
                            }
                            Spacer()
                        }
                    }
                            }
                        }
                    }
            }
        }
    }
}

struct ListOfCoaches_Previews: PreviewProvider {
    static var previews: some View {
        ListOfCoaches()
    }
}


var coaches = [
    Coach(firstName: "Ernest", lastName: "Khalimov", age: 43, skills: "Bodybuilding coach", profilePicture: "GigachadImage", description: "I'm gigachad and I can help you becoming a better version of yourself", localization: "Toulouse", visioCoaching: true, irlCoaching: true, fares: 20, coachRating: 4.2, userReviews: ["user1": "this is my review", "user2": "this is mine"], userRatings: ["user1": 1, "user2": 3]),
    Coach(firstName: "Brian", lastName: "Shaw", age: 39, skills: "Strongman coach", profilePicture: "BrianShawImage", description: "I'm a 4-time World's Strongest Man champion and I can help you become a better strongman competitor. My long experience and deep knowledge in the field will a real asset to boost your progress", localization: "Colorado", visioCoaching: true, irlCoaching: true, fares: 100, coachRating: 3.7, userReviews: ["Oliver": "Brian is an absolutely amazing strongman coach and I highly recommend his services", "Blake": "I've been training with Brian for just a few months and I've already seen major gains in my strength. He's really knowledgeable and patient with his teaching.", "Mary": "I would highly recommend this coach to anyone looking to get into strongman training. He's a great motivator and has an incredible depth of knowledge about the sport.", "John": "Overall, I had a good experience with this coach. He definitely knows his stuff when it comes to strongman training, but I did feel like he could have been a bit more communicative with me about my progress.", "Mohammed": "I wouldn't say I had a bad experience with this coach, but I also wouldn't say it was great. He was professional and knowledgeable, but I didn't feel like we had much of a personal connection or that he really understood my goals." ], userRatings: ["Oliver": 5, "Blake": 5, "Mary": 5, "John": 4, "Mohammed": 3.5]),
        Coach(firstName: "Ronnie", lastName: "Coleman", age: 57, skills: "Bodybuilding coach", profilePicture: "GigachadImage", description: "I'm an 8-time Mr. Olympia champion and I can help you achieve your bodybuilding goals", localization: "Texas", visioCoaching: true, irlCoaching: true, fares: 150, coachRating: 4.8),
        Coach(firstName: "Adam", lastName: "Ondra", age: 28, skills: "Rock climbing coach", profilePicture: "AdamOndraImage", description: "I'm a world-renowned rock climber and I can help you improve your climbing skills", localization: "Czech Republic", visioCoaching: true, irlCoaching: false, fares: 75, coachRating: 4.7, userRatings: ["user1": 1, "user2": 0]),
        Coach(firstName: "Mike", lastName: "Tyson", age: 55, skills: "Boxing coach", profilePicture: "MikeTysonImage", description: "I'm a former heavyweight champion and I can teach you the art of boxing", localization: "Nevada", visioCoaching: true, irlCoaching: true, fares: 200, coachRating: 4.9, userRatings: ["user1": 5, "user2": 5])
    ]

