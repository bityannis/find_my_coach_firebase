//
//  ContentView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 21/03/2023.
//
import Foundation
import SwiftUI
struct CustomColor {
    static let lightGray = Color("lightGray")
}

struct ListOfCoaches: View {
    init() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
        }
    @State private var searchCoach = ""
    @State private var showingSheet = false
    @State private var minimumRating: Double = 0.0
    @State private var isVisioCoachingOn = false
    @State private var isIRLCoachingOn = false
    var filteredCoaches: [Coach] {
        var result = [Coach]()
        if searchCoach.isEmpty {
            result = coaches
        } else {
            result = coaches.filter { coach in
                coach.firstName.range(of: searchCoach, options: .caseInsensitive) != nil ||
                coach.skills.range(of: searchCoach, options: .caseInsensitive) != nil ||
                coach.lastName.range(of: searchCoach, options: .caseInsensitive) != nil }
        }
        
        result = result.filter { coach in
            return coach.average() >= minimumRating
        }
        if isVisioCoachingOn {
            result = result.filter { coach in
                return coach.visioCoaching == isVisioCoachingOn
            }
        }
        if isIRLCoachingOn {
            result = result.filter { coach in
                return coach.irlCoaching == isIRLCoachingOn
            }
        }
        return result
    }

    var body: some View {
        let orderedCoaches = filteredCoaches.sorted {
                        $1.average() < $0.average()
        }

            NavigationStack {
                ZStack {
                Color(red: 30 / 255, green: 36 / 255, blue: 50 / 255)
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            Button {
                                showingSheet.toggle()
                            } label: {
                                ZStack(alignment: .trailing) {
                                    Rectangle()
                                .foregroundColor(.black)
                                .cornerRadius(30)
                                        .frame(width: 200, height: 50)
                                    HStack() {
                                        if isIRLCoachingOn {
                                            Image(systemName: "person.line.dotted.person.fill")
                                                .foregroundColor(.orange)
                                        }
                                        if isVisioCoachingOn {
                                            Image(systemName: "video.fill")
                                                .foregroundColor(.orange)
                                        }
                                        Text("\(minimumRating, specifier: "%.1f")")
                                            .font(.system(size: 14))
                                            .foregroundColor(.white)
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                            .scaleEffect(0.7)
                                            .frame(width: 5, height: 0)
                                            .offset(x: 0, y: -1)
                                        Text("+")
                                            .font(.system(size: 14))
                                            .offset(y: -1)
                                            .foregroundColor(.white)
                                        Image(systemName: "line.horizontal.3.decrease.circle.fill")
                                            .resizable()
                                            .foregroundColor(.orange)
                                            .frame(width: 35, height: 35)
                                            .padding(.horizontal, 10)
                                    }
                                }
                            }
                            .sheet(isPresented: $showingSheet) {
                                ZStack {
                                    Color.white
                                        .presentationDetents([.height(300)])
                                    FiltersModal(minimumRating: self.$minimumRating, isVisioCoachingOn: self.$isVisioCoachingOn, isIRLCoachingOn: self.$isIRLCoachingOn)
                                }
                            }
                            
                        }.padding(.horizontal)
                        ForEach(orderedCoaches){ coach in
                            NavigationLink(destination: CoachProfile(coach: coach)) {
                                VStack {
                                    ZStack {
                                        Rectangle()
                                            .cornerRadius(30)
                                            .foregroundColor(.black)
                                            .padding(.horizontal, 3)
                                        HStack {
                                            Image(coach.profilePicture)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 80, height: 80)
                                                .clipShape(Circle())
                                                .padding(.horizontal)
                                            VStack {
                                                HStack {
                                                    Text("\(coach.firstName) \(coach.lastName)")
                                                        .font(.system(size: 25))
                                                        .foregroundColor(.white)
                                                        .frame(alignment: .leading)
                                                        .padding(.top)
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
                                                        .foregroundColor(.white)
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
                    .searchable(text: $searchCoach, placement: .sidebar, prompt: "Rechercher un coach")
                }
            }
                .navigationTitle("Coachs")
        }
    }
}

struct FiltersModal: View {
    @Binding var minimumRating: Double
    @Binding var isVisioCoachingOn: Bool
    @Binding var isIRLCoachingOn: Bool
    var body: some View {
        VStack {
            Spacer()
            Text("Only display coaches with over \(minimumRating, specifier: "%.1f") stars")
            FiveStarView(rating: Decimal(minimumRating))
                .scaleEffect(0.5)
                .frame(width: 40, height: 40)
            Slider(value:$minimumRating, in: 0...5, step: 0.5) {
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("5")
            }.tint(.black)
                .padding([.leading, .bottom, .trailing], 20)
            HStack {
                Spacer()
                VStack() {
                    Toggle(isOn: $isVisioCoachingOn) {
                        Text("Online coaching")
                            .font(.system(size: 20))
                            .frame(width: 150, alignment: .trailing)
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                    .padding()
                    Toggle(isOn: $isIRLCoachingOn) {
                        Text("IRL coaching")
                            .font(.system(size: 20))
                            .frame(width: 150, alignment: .trailing)
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                    .padding()
                }
            }
        }
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                configuration.isOn ? configuration.label.foregroundColor(.orange) : configuration.label.foregroundColor(.black)
                Image(systemName: configuration.isOn ? "largecircle.fill.circle" : "circle")
                    .scaleEffect(2)
                    .foregroundColor(.orange)
                    .padding(.horizontal, 20)
            }
        })
    }
}

struct ListOfCoaches_Previews: PreviewProvider {
    static var previews: some View {
        ListOfCoaches()
    }
}

    var coaches = [
        Coach(firstName: "Ernest", lastName: "Khalimov", age: 43, skills: "Tout", profilePicture: "GigachadImage", description: "Je suis GIGACHAD et je vais vous aider à devenir une meilleure version de vous-même.", localization: "Toulouse", visioCoaching: false, irlCoaching: true, fares: 20, coachRating: 4.2, userReviews: ["Yannis": "Gigachad est LE coach ultime", "Bryan": "Epoustouflant"], userRatings: ["Yannis": 5, "Bryan": 5, "Jules": 5, "Tom": 5]),
        Coach(firstName: "Brian", lastName: "Shaw", age: 39, skills: "Strongman", profilePicture: "BrianShawImage", description: "Je suis un champion de l'homme le plus fort du monde 4 fois et je peux vous aider à devenir un meilleur concurrent de strongman. Mon immense expérience et ma connaissance approfondie dans le domaine seront un véritable atout pour accélérer votre progression.", localization: "Colorado", visioCoaching: true, irlCoaching: true, fares: 100, userReviews: ["Kevin": "Je m'entraîne avec Brian depuis quelques mois seulement et j'ai déjà constaté des gains importants en termes de force. Il est vraiment compétent et patient dans son enseignement.", "Marie": "Je recommanderais vivement ce coach à quiconque souhaite se lancer dans l'entraînement de strongman. Il est un excellent motivateur et possède une connaissance incroyablement approfondie du sport.", "Jean": "Dans l'ensemble, j'ai eu une bonne expérience avec ce coach. Il connaît vraiment son sujet en matière d'entraînement Strongman, mais j'ai eu l'impression qu'il aurait pu être un peu plus communicatif avec moi concernant mes progrès.", "Mohammed": "Je ne dirais pas que j'ai eu une mauvaise expérience avec ce coach, mais je ne dirais pas non plus que c'était génial. Il était professionnel et compétent, mais je n'ai pas eu l'impression que nous avions beaucoup de connexion personnelle ou qu'il comprenait vraiment mes objectifs." ], userRatings: ["Kevin": 5, "Marie": 5, "Robert": 5, "Jean": 4, "Mohammed": 3.5, "Mathias": 0]),
        Coach(firstName: "Khabib", lastName: "Nurmagomedov", age: 33, skills: "MMA", profilePicture: "KhabibNurmagomedovImage", description: "J'ai été un champion du monde de MMA invaincu avec un record de 29 victoires et 0 défaites. Je peux vous enseigner les techniques les plus efficaces pour gagner en MMA, ainsi que la préparation mentale nécessaire pour réussir dans ce sport. Mon approche est basée sur la discipline et le respect.", localization: "Daghestan", visioCoaching: true, irlCoaching: true, fares: 100, userReviews: ["Sophie": "Khabib est un coach incroyablement compétent et passionné. J'ai vu une nette amélioration de mes compétences en MMA depuis que j'ai commencé à travailler avec lui.", "Pierre": "Khabib est très exigeant mais cela en vaut vraiment la peine. Je me sens plus confiant dans mon jeu au sol et j'ai également amélioré mon endurance.", "Luc": "J'ai eu des séances d'entraînement avec Khabib pendant quelques mois et j'ai vu une nette amélioration de mes compétences en MMA. Il est très patient et encourageant.", "Emilie": "Khabib est un excellent coach de MMA. Il m'a appris beaucoup de choses intéressantes sur les techniques de combat et la préparation mentale et je me sens beaucoup plus confiante dans ma pratique maintenant."], userRatings: ["Sophie": 5, "Pierre": 4.5, "Luc": 5, "Emilie": 5]),
        Coach(firstName: "Kébab", lastName: "Nurmagomedov", age: 33, skills: "MMA", profilePicture: "KhabibNurmagomedovImage", description: "J'ai été un champion du monde de MMA invaincu avec un record de 29 victoires et 0 défaites. Je peux vous enseigner les techniques les plus efficaces pour gagner en MMA, ainsi que la préparation mentale nécessaire pour réussir dans ce sport. Mon approche est basée sur la discipline et le respect.", localization: "Daghestan", visioCoaching: true, irlCoaching: true, fares: 100, userRatings: [:]),
        Coach(firstName: "Jay", lastName: "Cutler", age: 48, skills: "Bodybuilding", profilePicture: "JayCutlerImage", description: "J'ai remporté de nombreux titres de culturisme, dont 4 fois le Mr. Olympia. Je peux vous aider à atteindre vos objectifs en matière de musculation, que vous soyez débutant ou confirmé. Mon approche est basée sur la discipline et la rigueur.", localization: "Las Vegas", visioCoaching: true, irlCoaching: false, fares: 80, userReviews: ["Sophie": "Jay est un coach incroyablement compétent et passionné. J'ai vu une nette amélioration de ma musculature depuis que j'ai commencé à travailler avec lui.", "Pierre": "Jay est très exigeant mais cela en vaut vraiment la peine. Je me sens plus fort et plus en forme que jamais.", "Luc": "J'ai eu des séances d'entraînement avec Jay pendant quelques semaines mais j'ai arrêté car je n'arrivais pas à supporter son attitude autoritaire.", "Emilie": "Jay est un excellent coach de musculation. Il m'a appris beaucoup de choses intéressantes sur l'entraînement et la nutrition et je me sens beaucoup plus confiante dans ma pratique maintenant."], userRatings: ["Sophie": 5, "Pierre": 4.5, "Luc": 2, "Emilie": 4.5, "Marc": 1, "Igor": 1.5, "Vladimir": 0]),
        Coach(firstName: "Serena", lastName: "Williams", age: 40, skills: "Tennis", profilePicture: "SerenaWilliamsImage", description: "Je suis l'une des meilleures joueuses de tennis de tous les temps, avec de nombreux titres majeurs à mon actif. Je peux vous aider à améliorer votre technique et votre condition physique pour que vous puissiez jouer au meilleur de vos capacités.", localization: "Floride", visioCoaching: false, irlCoaching: true, fares: 75, userReviews: ["Marc": "Serena est une coach de tennis incroyablement compétente. Elle m'a aidé à améliorer tous les aspects de mon jeu, y compris ma puissance, ma vitesse et mon contrôle.", "Mélissa": "Je suis ravie d'avoir travaillé avec Serena. Elle est très motivante et m'a aidé à retrouver confiance en moi sur le court.", "Maxime": "Je n'ai pas eu une très bonne expérience avec Serena. Je pense qu'elle était souvent impatiente et qu'elle ne prenait pas suffisamment de temps pour expliquer les exercices.", "Julie": "Je recommande vivement Serena à tous ceux qui cherchent à améliorer leur jeu de tennis. Elle est très professionnelle et compétente, et j'ai beaucoup appris en travaillant avec elle."], userRatings: ["Marc": 4.5, "Mélissa": 5, "Maxime": 2, "Julie": 4.5, "Lola": 0, "Elodie": 0, "Anna": 0]),
        Coach(firstName: "Alex", lastName: "Honnold", age: 36, skills: "Escalade", profilePicture: "AlexHonnoldImage", description: "J'ai réussi des ascensions en solo intégral incroyablement difficiles à travers le monde. Je peux vous aider à améliorer votre technique et à surmonter vos peurs. Mon approche est basée sur la confiance en soi et la préparation mentale.", localization: "Californie", visioCoaching: true, irlCoaching: true, fares: 50, userReviews: ["Sophie": "Alex est un coach très attentif et compétent. J'ai vraiment apprécié ses conseils et je me sens beaucoup plus confiante dans ma pratique de l'escalade en solo intégral maintenant.", "Pierre": "J'ai travaillé avec Alex pendant plusieurs mois et j'ai vu une nette amélioration de mes compétences en escalade. Il est très encourageant et patient.", "Luc": "Je n'ai pas eu une très bonne expérience avec Alex. Je pense qu'il a été un peu trop sévère avec moi pendant les séances d'entraînement et je n'ai pas beaucoup progressé.", "Emilie": "J'ai adoré travailler avec Alex. Il est vraiment passionné par l'escalade et cela se voit dans sa façon d'enseigner. J'ai appris beaucoup de choses intéressantes et j'ai hâte de continuer à progresser avec lui."], userRatings: ["Sophie": 4.5, "Pierre": 5, "Luc": 2.5, "Emilie": 5]),
        Coach(firstName: "Mike", lastName: "Tyson", age: 55, skills: "Boxe", profilePicture: "MikeTysonImage", description: "Je suis un ancien champion du monde de boxe poids lourd et je peux vous enseigner les techniques les plus efficaces pour vaincre vos adversaires. Je suis très passionné par la boxe et j'aime partager mes connaissances avec les autres.", localization: "Nevada", visioCoaching: true, irlCoaching: false, fares: 40, userReviews: ["Sofiane": "Mike est un excellent coach de boxe. Il m'a aidé à améliorer ma technique et ma condition physique en très peu de temps.", "Eva": "Je recommande vivement Mike pour tous ceux qui cherchent à apprendre la boxe. Il est très patient et encourageant, même avec les débutants.", "Julien": "J'ai été un peu déçu par les séances d'entraînement avec Mike. Je pensais qu'il serait plus impliqué dans mon entraînement, mais il semblait souvent distrait.", "Aurélie": "J'ai adoré travailler avec Mike. Il est très compétent et m'a appris beaucoup de choses intéressantes sur la boxe. Je me sens beaucoup plus confiante dans ma pratique maintenant."], userRatings: ["Sofiane": 5, "Eva": 4.5, "Julien": 3, "Aurélie": 5]),
        Coach(firstName: "Mike", lastName: "Téflon", age: 55, skills: "Boxe", profilePicture: "MikeTysonImage", description: "Je suis un ancien champion du monde de boxe poids lourd et je peux vous enseigner les techniques les plus efficaces pour vaincre vos adversaires. Je suis très passionné par la boxe et j'aime partager mes connaissances avec les autres.", localization: "Nevada", visioCoaching: true, irlCoaching: false, fares: 40, userRatings: [:]),
        Coach(firstName: "Nairo", lastName: "Quintana", age: 32, skills: "Cyclisme", profilePicture: "NairoQuintanaImage", description: "Je suis un cycliste professionnel", localization: "Brésil", visioCoaching: true, irlCoaching: true, fares: 35, userRatings: ["Jean-Gabin": 1])
    ]

