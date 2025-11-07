import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";

actor Token {

  let owner : Principal = Principal.fromText("773xt-fa4hy-tncuo-j6lmd-446vz-sriqc-kd5u5-wui7g-oau6n-nrodp-eae");
  let totalSupply : Nat = 1_000_000_000_000_000;
  let symbol : Text = "JELLY";

  private stable var balanceEntries : [(Principal, Nat)] = [];
  private var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);

  if (balances.size() < 1) {
    balances.put(owner, totalSupply);
  };

  public query func balanceOf(who: Principal) : async Nat {
    switch (balances.get(who)) {
      case null 0;
      case (?result) result;
    };
  };

  public query func getSymbol() : async Text {
    return symbol;
  };

  public shared(msg) func payOut() : async Text {
    Debug.print("Caller: " # debug_show(msg.caller));
    if (balances.get(msg.caller) == null) {
      let amount = 10_000; // faucet reward
      let result = await faucetTransfer(msg.caller, amount);
      return result;
    } else {
      return "Already Claimed";
    };
  };

  // Faucet transfer — uses owner's balance
  private func faucetTransfer(to: Principal, amount: Nat) : async Text {
    let fromBalance = await balanceOf(owner);
    if (fromBalance >= amount) {
      balances.put(owner, fromBalance - amount);
      let toBalance = await balanceOf(to);
      balances.put(to, toBalance + amount);
      return "Success";
    } else {
      return "Owner has Insufficient Funds";
    };
  };

  // Normal user transfer
  public shared(msg) func transfer(to: Principal, amount: Nat) : async Text {
    let fromBalance = await balanceOf(msg.caller);
    if (fromBalance >= amount) {
      balances.put(msg.caller, fromBalance - amount);
      let toBalance = await balanceOf(to);
      balances.put(to, toBalance + amount);
      return "Success";
    } else {
      return "Insufficient Funds";
    };
  };

  system func preupgrade() {
    balanceEntries := Iter.toArray(balances.entries());
  };

  system func postupgrade() {
    balances := HashMap.fromIter<Principal, Nat>(
      Iter.fromArray(balanceEntries),
      1,
      Principal.equal,
      Principal.hash,
    );

    if (balances.size() < 1) {
      balances.put(owner, totalSupply);
    };
  };
}
