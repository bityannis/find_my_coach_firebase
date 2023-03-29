//
//  CoachProfile.swift
//  FindMyCoach
//
//  Created by Apprenant 01 on 21/03/2023.
//

import Foundation
import SwiftUI

struct CoachProfile: View {
    var coach: Coach
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .center) {
                        Image(coach.profilePicture)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 380, height: 300)
                            .cornerRadius(40)
                            .clipped()
                            .padding([.top, .leading, .trailing])
                        VStack(alignment: .center) {
                            Text("\(coach.firstName) \(coach.lastName)")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                            if coach.userRatings.count == 0 {
                                Text("No ratings yet")
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 36)
                            } else {
                                FiveStarView(rating: Decimal(coach.average()))
                                    .scaleEffect(0.4)
                                    .offset(x: 0, y: -20)
                            }
                            VStack {
                                Text(coach.skills)
                                    .font(.system(size: 24))
                                    .padding(.bottom)
                                HStack {
                                    Spacer()
                                    if coach.visioCoaching == true {
                                        Image(systemName: "video.fill")
                                            .scaleEffect(1.5)
                                            .padding(.bottom, 10)
                                    } else {
                                        Image(systemName: "video.slash.fill")
                                            .scaleEffect(1.5)
                                            .padding(.bottom, 10)
                                    }
                                    if coach.irlCoaching == true {
                                        Spacer()
                                            HStack {
                                            Image(systemName: "mappin.circle.fill")
                                                .padding(.trailing, 10)
                                                .scaleEffect(1.5)
                                            Text(coach.localization)
                                                .font(.system(size: 24))
                                        }
                                            .padding(.bottom, 10)
                                    }
                                    Spacer()
                                }
                                .padding([.leading, .bottom, .trailing])
                                
                            }
                        }
                        Text(coach.description)
                            .font(.system(size: 16))
                            .multilineTextAlignment(.leading)
                            .padding([.leading, .bottom, .trailing], 10)
                        HStack {
                            Spacer()
                            NavigationLink {
                                ChatView()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 150, height: 60)
                                        .foregroundColor(.orange)
                                        .cornerRadius(CGFloat(20))
                                    HStack {
                                        Text("CONTACT")
                                            .font(.system(size: 22))
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        Divider()
                        HStack{
                            if coach.userReviews.count <= 1 {
                                HStack {
                                    Text("\(coach.userReviews.count) Review")
                                        .padding([.leading, .trailing])
                                        .font(.system(size: 16))
                                    if coach.userRatings.count <= 1 {
                                        Text("\(coach.userRatings.count) Rating")
                                            .padding([.leading, .trailing])
                                            .font(.system(size: 16))
                                    } else {
                                        Text("\(coach.userRatings.count) Ratings")
                                            .padding([.leading, .trailing])
                                            .font(.system(size: 16))
                                    }
                                }
                            } else {
                                Text("\(coach.userReviews.count) Reviews")
                                    .padding([.leading, .trailing])
                                    .font(.system(size: 16))
                                Text("\(coach.userRatings.count) Ratings")
                                    .padding([.leading, .trailing])
                                    .font(.system(size: 16))
                            }
                            Spacer()
                        }
                        Divider()
                        VStack {
                            ForEach(coach.userReviews.sorted(by: <), id: \.key){ user, review in
                                HStack {
                                    VStack(alignment: .leading){
                                        Text(user)
                                            .font(.system(size: 22))
                                        FiveStarView(rating: Decimal(coach.userRatings[user]!))
                                            .scaleEffect(0.25)
                                            .offset(x: -140, y: -33)
                                    }
                                    .padding(.horizontal, 20)
                               }
                                HStack {
                                    Text(review)
                                        .font(.system(size: 16))
                                        .padding(.horizontal, 16)
                                }
                                .offset(y: -40)
                                Divider()
                                    .frame(height: 1)
                                    .overlay(.black)
                                    .offset(y: -20)
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
        }
        
    }
}
        

struct CoachProfile_Previews: PreviewProvider {
    static var previews: some View {
        CoachProfile(coach: coaches[1])
    }
}


