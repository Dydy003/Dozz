//
//  OnboardingView.swift
//  Dozz
//
//  Created by Dylan Caetano on 17/11/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("Onboarding") private var Onboarding = false
    
    @StateObject private var viewModel = OnboardingViewModel()
    
    @State private var currentIndex: Int = 0
    
    
    var body: some View {
        ZStack {
            Color.gradient.ignoresSafeArea()
            
            VStack {
                if currentIndex < viewModel.items.count {
                    let item = viewModel.items[currentIndex]
                    
                    VStack(spacing: 30) {
                        
                        Spacer()
                        
                        Image(systemName: item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 90)

                        Text(item.title)
                            .font(.title)
                            .bold()
                        
                        Text(item.description)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        if #available(iOS 17.0, *) {
                            Button("Next") {
                                if currentIndex < viewModel.items.count - 1 {
                                    currentIndex += 1
                                } else {
                                    Onboarding = true
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.color4)
                            .foregroundStyle(Color.color2).bold()
                            .clipShape(.buttonBorder)
                            
                        } else {
                            Button("Next") {
                                if currentIndex < viewModel.items.count - 1 {
                                    currentIndex += 1
                                } else {
                                    Onboarding = true
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.color4)
                            .foregroundStyle(Color.color2).bold()
                            .cornerRadius(15)
                        }
                        
                        if currentIndex < viewModel.items.count - 1 {
                            Button("Skip") {
                                Onboarding = true
                            }
                            .foregroundStyle(Color.colorText.opacity(0.5)).bold()
                        }
                    }
                    .padding()
                    .transition(.slide)
                    .foregroundStyle(Color.colorText)
                    
                } else {
                    Text("Welcome to the app!")
                }
            }
            .animation(.easeInOut, value: currentIndex)
        }
    }
}

#Preview {
    OnboardingView()
}
