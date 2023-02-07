//
//  AppMain.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import SwiftUI
import PetSaveOnboarding

@main
struct AppMain: App {
  @AppStorage(AppUserDefaultsKeys.onboarding) var shouldPresentOnboarding = true

  var onboardingModels: [OnboardingModel] {
    [
      OnboardingModel(
        title: "Welcome to\n AdoptAPet",
        description: "Looking for a Pet?\n Then you're at the right place",
        image: .bird
      ),
      OnboardingModel(
        title: "Search...",
        description: "Search from a list of our huge database of animals.",
        image: .dogBoneStand
      ),
      OnboardingModel(
        title: "Nearby",
        description: "Find pets to adopt from nearby your place...",
        image: .chameleon
      )
    ]
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
        .fullScreenCover(isPresented: $shouldPresentOnboarding, onDismiss: nil) {
            PetSaveOnboardingView(items: onboardingModels)
            .onSkip {
              shouldPresentOnboarding = false
            }
        }
    }
  }
}
