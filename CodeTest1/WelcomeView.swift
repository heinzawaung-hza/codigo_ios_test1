//
//  WelcomeView.swift
//  CodeTest1
//
//  Created by Hein Aung on 27/07/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Background()
                VStack{
                    VStack(alignment: .leading, spacing: 15) {
                        Spacer()
                        WelcomeText()
                        LogginButtons()
                    }
                    .padding()
                    .padding(.bottom)
                }
            }
            .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func Background() -> some View {
        VStack {
            Image("welcome")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
        VStack {
            Spacer()
            Image("clouds")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    
    @ViewBuilder
    func WelcomeText() -> some View {
        Text("Welcome to \nReady To Travel")
            .font(Font.custom("Chivo-Bold", size: 36))
        Text("Sign up with Facebook for the most fulfilling trip planning experience with us")
            .withNormalTextFormatting()
        
    }
    
    @ViewBuilder
    func LogginButtons() -> some View {
        
        Button {
            ///TODO facebook login
        } label: {
            Text("Log in with Facebook")
                .withDefaultButtonFormatting()
        }
        
        Button {
            ///TODO email login
        } label: {
            Text("Log in with email address")
                .withDefaultButtonFormatting()
        }
        
        NavigationLink {
            RegisterView()
        } label: {
            Text("Create a new account")
        }
        .buttonStyle(GradientButtonStyle())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
