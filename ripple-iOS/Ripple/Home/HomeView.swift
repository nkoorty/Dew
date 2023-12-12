//
//  HomeView.swift
//  Ripple
//
//  Created by Artemiy Malyshau on 10/12/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn
import metamask_ios_sdk
import Combine

struct HomeView: View {
    
    @State private var balance: String = "0 ETH"
    @State private var mmConnected: Bool = false
    
    @ObservedObject var ethereum = MetaMaskSDK.shared.ethereum
    @State private var cancellables: Set<AnyCancellable> = []

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        VStack(spacing: 12) {
                            HStack(spacing: 2) {
                                VStack(alignment: .leading) {
                                    Image(systemName: "dollarsign.circle.fill")
                                        .font(.system(size: 20))
                                        .padding(.bottom, 2)
                                    Text(mmConnected ? "\(balance)" : "0 ETH")
                                            .fontWeight(.semibold)
                                    Text("Your balance")
                                        .font(.caption)
                                }
                                .offset(x: -22)
                                .frame(maxWidth: .infinity, maxHeight: 140)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                                
                                Spacer()

                                VStack(alignment: .leading) {
                                    Image(systemName: "lanyardcard")
                                        .font(.system(size: 20))
                                        .padding(.bottom, 2)
                                    Text("4 Events")
                                        .fontWeight(.semibold)
                                    Text("Relevant to you")
                                        .font(.caption)
                                }
                                .offset(x: -16)
                                .frame(maxWidth: .infinity, maxHeight: 140)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                    
                    Section {
                        VStack(alignment: .leading, spacing: 10) {
                             (Text("Latest news: ").fontWeight(.bold) +
                             Text("Imperial College Robotics Society is organising a Line Follower competition.")
                                .fontWeight(.regular))
                                .font(.system(size: 19))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue.opacity(0.3)))
                                .listRowInsets(EdgeInsets())
                        }
                    }
                    .listRowSeparator(.hidden)
                    
                    Section {
                        ForEach(preSocieties, id: \.id) { society in
                            NavigationLink {
                                ClubView(society: society)
                            } label: {
                                HStack(spacing: 12) {
                                    Image(society.imageUrl)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(10)
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(society.type.rawValue)
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                        
                                        Text(society.name)
                                    }
                                }
                            }
                        }
                    } header: {
                        HStack {
                            Button {

                            } label: {
                                Text("Memberships")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Spacer()
                            
                            NavigationLink {
                                
                            } label: {
                                Text("See more")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
                    .headerProminence(.increased)
                    
                    Section {
                        ForEach(loyalties, id: \.id) { loyalty in
                            NavigationLink {
                                LoyaltyView(society: loyalty)
                            } label: {
                                HStack(spacing: 12) {
                                    Image(loyalty.imageUrl)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(10)
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(loyalty.type.rawValue)
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                        
                                        Text(loyalty.name)
                                    }
                                }
                            }
                        }
                    } header: {
                        HStack {
                            Text("Loyalty Programmes")
                            
                            Spacer()
                            
                            NavigationLink {
                                
                            } label: {
                                Text("See more")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
                    .headerProminence(.increased)
                }
                .listStyle(.inset)
                .onAppear(perform: fetchBalance)
            }
            .navigationTitle("Home")
        }
    }
    
    private func fetchBalance() {
        guard mmConnected else { return }

        let parameters: [String] = [
            ethereum.selectedAddress,
            "latest"
        ]
      
        let getBalanceRequest = EthereumRequest(
            method: .ethGetBalance,
            params: parameters
        )

        ethereum.request(getBalanceRequest)?.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print("\(error.localizedDescription)")
            default: break
            }
        }, receiveValue: { result in
            self.balance = result as! String
        })
        .store(in: &cancellables)
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}

func logOut() {
    do {
        try Auth.auth().signOut()
    } catch let signOutError as NSError {
        print("Error signing out: \(signOutError)")
    }

    GIDSignIn.sharedInstance.signOut()

    UserDefaults.standard.set(false, forKey: "signin")
}

