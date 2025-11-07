# 💎 DRivex Finance  
**By Aditya Mahekar**

A decentralized token project built on the Internet Computer (ICP) network.  
It provides a faucet, balance checker, and transfer system for the **JELLY Token**.

---

## 🖼️ Project Preview


| | |
|:--:|:--:|
| ![UI](./imgg/jly1.png) | ![Claim 10000 Tokens](./imgg/jly2.png) |
| ![Paste Profile 1 ID](./imgg/jly3.png) | ![Check Balance of Profile 1](./imgg/jly4.png) |
| ![Profile 2 Balance](./imgg/jly5.png) | ![Profile 1 Balance Credited](./imgg/jly6.png) |
| ![Profile to Balance Transfer](./imgg/jly7.png) | ![Profile 2 Transfer 50 Tokens Successfully](./imgg/jly8.png) |
| ![Profile 2 Balance Debit](./imgg/jly9.png) | ![Profile 2 Insufficient Fund](./imgg/jly10.png) |

---
# ⚙️ Setup and Local Deployment


1. Install dependencies
```bash
npm i
```
3. Start the local ICP replica
```bash
dfx start --clean
```
5. Deploy your canisters (backend + frontend)
```bash
dfx deploy
```
6. Start the frontend locally
```bash
npm start
```

Once the project starts, open it in your browser at:
👉 http://localhost:1080

---

## 🖼️ Project Preview

| | |
|:--:|:--:|
| ![UI](./imgg/jly1.png) | ![Claim 10000 Tokens](./imgg/jly2.png) |
| ![Paste Profile 1 ID](./imgg/jly3.png) | ![Check Balance of Profile 1](./imgg/jly4.png) |
| ![Profile 2 Balance](./imgg/jly5.png) | ![Profile 1 Balance Credited](./imgg/jly6.png) |
| ![Profile to Balance Transfer](./imgg/jly7.png) | ![Profile 2 Transfer 50 Tokens Successfully](./imgg/jly8.png) |
| ![Profile 2 Balance Debit](./imgg/jly9.png) | ![Profile 2 Insufficient Fund](./imgg/jly10.png) |

---

# 💰 Check Your Balance

1. Find out your principal id:

```bash
 dfx identity get-principal
```
Save it somewhere.
Example:773xt-fa4hy-tncuo-j6lmd-446vz-sriqc-kd5u5-wui7g-oau6n-nrodp-eae

bash
Copy code
OWNER_PUBLIC_KEY="principal \"$( \dfx identity get-principal )\""
Check that step 3 worked by printing it out:

bash
Copy code
echo $OWNER_PUBLIC_KEY
Check the owner's balance:

bash
Copy code
dfx canister call token balanceOf "( $OWNER_PUBLIC_KEY )"
⚡ Charge the Canister
Check canister ID:

bash
Copy code
dfx canister id token
Save canister ID into a command line variable:

bash
Copy code
CANISTER_PUBLIC_KEY="principal \"$( \dfx canister id token )\""
Check canister ID has been successfully saved:

bash
Copy code
echo $CANISTER_PUBLIC_KEY
Transfer half a billion tokens to the canister Principal ID:

bash
Copy code
dfx canister call token transfer "($CANISTER_PUBLIC_KEY, 500_000_000)"
🌐 Deploy the Project to the Live IC Network
Create and deploy canisters:

bash
Copy code
dfx deploy --network ic
Check the live canister ID:

bash
Copy code
dfx canister --network ic id token
Save the live canister ID to a command line variable:

bash
Copy code
LIVE_CANISTER_KEY="principal \"$( \dfx canister --network ic id token )\""
Check that it worked:

bash
Copy code
echo $LIVE_CANISTER_KEY
Transfer some tokens to the live canister:

bash
Copy code
dfx canister --network ic call token transfer "($LIVE_CANISTER_KEY, 50_000_000)"
Get live canister front-end id:

bash
Copy code
dfx canister --network ic id token_assets
Copy the ID from step 6 and add .raw.ic0.app to the end to form a URL.
Example:

Copy code
zdv65-7qaaa-aaaai-qibdq-cai.raw.ic0.app
