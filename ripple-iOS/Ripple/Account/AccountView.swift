//
//  ProfileView.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 10/12/2023.
//

import SwiftUI
import Combine
import metamask_ios_sdk

struct AccountView: View {
    
    @AppStorage("mmconnected") var mmConnected = false
    @AppStorage("signin") var isSignedIn = true

    @ObservedObject var ethereum = MetaMaskSDK.shared.ethereum
    @State private var cancellables: Set<AnyCancellable> = []

    private let dapp = Dapp(name: "Dew", url: "https://nkoorty.com")

    @State private var connected: Bool = false
    @State private var status: String = "Offline"

    @State private var errorMessage = ""
    @State private var showError = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Artemiy Malyshau")
                            
                            if mmConnected {
                                Text(ethereum.selectedAddress)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .padding(.vertical, 6)
                    }
                    
                    Section {
                        Button {
                            ethereum.connect(dapp)?.sink(receiveCompletion: { completion in
                                switch completion {
                                case let .failure(error):
                                    errorMessage = error.localizedDescription
                                    showError = true
                                    print("Connection error: \(errorMessage)")
                                default: break
                                }
                            }, receiveValue: { result in
                                print("Connection result: \(result)")
                                mmConnected = true
                            }).store(in: &cancellables)
                        } label: {
                            HStack {
                                Image("metamask")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(1)
                                    .background(.white)
                                    .cornerRadius(6)
                                
                                Text("MetaMask")
                                
                                Spacer()
                                
                                Text(mmConnected ? "Connected" : "Not Connected")
                                    .foregroundStyle(.gray)
                            }
                        }
                        
                        HStack {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(1)
                                .background(.white)
                                .cornerRadius(6)
                            
                            Text("Google")
                            
                            Spacer()
                            
                            Text(isSignedIn ? "Connected" : "Not Connected")
                                .foregroundStyle(.gray)
                        }
                    } header: {
                        Text("Connections")
                    }
                    
                    Section {
                        NavigationLink {
                            
                        } label: {
                            Text("Notifications")
                        }
                    } footer: {
                        Text("Customize how you receive updates about your account, announcements, and more.")
                    }
                    
                    Section{
                        Button {
                            logOut()
                        } label: {
                            Text("Sign Out")
                                .foregroundStyle(.red)
                        }
                    } footer: {
                        Text("Sign out of your Ripple account.")
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    AccountView()
        .preferredColorScheme(.dark)
}
