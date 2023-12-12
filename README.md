# Dew - XRP EVM on iOS
Dew is an iOS app designed for any club, society, or establishment looking to manage memberships or subscriptions through Solidity smart contracts. Using Ripple, users can easily track all transactions related to their memberships. Ripple ensures secure and transparent money transfers between addresses, backed by an immutable record and a dedicated smart contract powered by the EVM sidechain that oversees every aspect of membership or loyalty programs.

For an introduction and demo of Dew, click [here](https://youtu.be/RzVe-kX9QkU) or click [here](https://youtu.be/Q6cnbk5JIc0) for a comprehensive code walkthrough.

### Images
<img src=https://github.com/nkoorty/Dew/assets/80065244/c2d27c33-838b-4780-928c-58a6cb87676b width=15% >
<img src=https://github.com/nkoorty/Dew/assets/80065244/35b3603c-4820-411c-a7ec-ca6c550b8c0d width=15% >
<img src=https://github.com/nkoorty/Dew/assets/80065244/aee96662-78af-4619-af2b-fe8c56b75240 width=15% >
<img src=https://github.com/nkoorty/Dew/assets/80065244/74d2103b-033a-4ebf-993e-3c85fde6da25 width=15% >
<img src=https://github.com/nkoorty/Dew/assets/80065244/03612b60-e8f2-4e1c-b9b9-297fc1afa2a2 width=15% >
<img src=https://github.com/nkoorty/Dew/assets/80065244/43523277-7af4-482f-8bc9-c563945e192f width=15% >


## How I built it
Dew is built using Swift and SwiftUI for the frontend, and a JavaScript Hardhat project in the backend. The frontend and backend interact with an Express.js server and Google Firebase is used to store user data and all relevant data in the userbase.

The SwiftUI frontend uses the Google OAuth login using the GoogleSignIn-iOS library and connects to the MetaMask iOS app using the appropriate SDK. Most networking calls are managed by the Combine networking library, where address and balance fetching, as well as smart contract interaction, is handled locally on device.

The hardhat project entails 2 Solidity smart contracts: one for a membership, and another for a loyalty programme. They both provide the relevant functions with respect to the purpose of the contract. The functions can be interacted with using several JavaScript scripts that either create a new contract, or interact with it, as demonstrated at the end of the Code Walkthrough.

## Challenges I ran into
While building this project, I've ran into the following challenges:

* **Bridging XRP to the Sidechain:** The website was sometimes unavailabel and I ran into several troubles when attempting to bridge my XRP to my MetaMask wallet.
* **MetaMask iOS SDK:** Using the MetaMask iOS SDK was a new experience that requireed for me to learn and understand complex networking calls and implement deeplinks that would load data back into the app. It took a lot learning, but the working implementatino is therefore more satisfying.

## What I learned
This hackathon marked my first time interacting with the Ripple ecosystem, and it was great to see the intiative for an EVM sidechain, as it made development significantly easier. I was already familiar with building projects using Hardhat/EVM projects, so it was great to tap into such a massive ecosystem so seamlessly.

Not only did I learn about the ecosystem itself, but also what Ripple is utilised for, contributing to the idea that is Dew. As previously touched upon, I also learned a lot about Swift networking calls and creating a seamless interaction with the MetaMask iOS SDK - something that will definetely lower hte barrier of entry for users very inexperienced with Web3.

## What's next for Dew
While building Dew, several advancements for functionalities would complement the ethos of the app.

* Membership adminstrators have a built-in QR Code reader to verify via Dew that a person is indeed a members
* Database that stores each transaction hash against the name obtained from the Google OAuth login, to have a comprehensive overview of who paid when and how much. This is especially useful if dealing with legacy finance offices, which may not be very familiar with Web3 and how it works.
* Memberships provide exclusive content such as videos, tutorials, or any other materials. This would add incentives for people to purchase memberships.
* Dew only works if one bridges their XRP onto the sidechain and connects it to their MetaMask, implementing a bridge within the app would be immense for the longevitiy and user experience of the app.
