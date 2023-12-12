//
//  LoginView.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 10/12/2023.
//

import SwiftUI
import GoogleSignIn
import FirebaseAuth
import Firebase

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showWalletView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Ripple_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    VStack(spacing: 12) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 140)
                            .cornerRadius(34)
                            .hCenter()
                    }
                    .padding(.vertical, 34)
                    .padding(.top, 26)
                    
                    
                    TextField("E-mail address", text: $email)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    Color.white.opacity(0.04)
                                )
                        }
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    Color.white.opacity(0.04)
                                )
                        }
                        .textInputAutocapitalization(.never)
                        .padding(.top, 0)
                        .padding(.bottom, 20)
                    
                    Divider()
                        .padding(.vertical, 0)
                    
                    Button {
                        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                        
                        let config = GIDConfiguration(clientID: clientID)
                        GIDSignIn.sharedInstance.configuration = config
                        
                        GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { result, error in
                            guard error == nil else {
                                // ...
                                return
                            }
                            
                            guard let user = result?.user,
                                  let idToken = user.idToken?.tokenString
                            else {
                                // ...
                                return
                            }
                            
                            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
                            
                            Auth.auth().signIn(with: credential) { result, error in
                                
                                guard error == nil else {
                                    return
                                }
                                
                                print("Signed in")
                                UserDefaults.standard.set(true, forKey: "signin")
                            }
                        }
                    } label: {
                        HStack(spacing: 12) {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            
                            Text("Sign in with Google")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .hCenter()
                        .padding(.leading, 10)
                        .offset(x: -6)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white.opacity(0.1))
                                .frame(height: 50)
                        )
                    }
                    .padding(.top, 24)
                    //                .padding(.horizontal, 16)
                    
                    
                   
                    Button {
                        
                    } label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.60))
                            
                            Text("Sign Up")
                                .font(.caption)
                                .foregroundColor(.blue)
                            
                        }
                    }
                    .hCenter()
                    .padding(.top, 20)
                    .padding(.leading, 4)
                    
                    Spacer()
                    
                    NavigationLink {
                        TabBarView()
                    } label: {
                        HStack(spacing: 12) {
                            Text("Login")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.white)
                        }
                        .hCenter()
                        .padding(.leading, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.blue.opacity(0.8))
                                .frame(height: 50)
                        )
                        .padding(.top, 20)
                    }
                    
                    Text("By continuing, you agree to our User Agreement and Privacy Policy.")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.60))
                        .hCenter()
                        .padding(.top, 20)
                        .padding(.leading, 4)
                    
                    Spacer()
                }
                .padding(.top, 60)
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    LoginView()
        .preferredColorScheme(.dark)
}
