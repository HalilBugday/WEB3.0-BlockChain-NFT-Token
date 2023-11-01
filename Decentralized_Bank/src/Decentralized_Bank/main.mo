import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor Dbank{     //class
  stable var currentValue: Float = 400; //dec (orogonal kalıcı)
  //currentValue := 100; //assign (init)


  Debug.print("Hello");
  Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime)); // from 01.01.1970 to now (nanosecond)

  let id = 10; //if value never change, use let

  //Nat -> natural number
  public func topUp(amount: Float){ //Update method
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount: Float){ //update method
    let tempValue: Float = currentValue-amount;
    if(tempValue >=0 ){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Insufficient balance!");
    }
  };

  public query func checkBalance(): async Float { //query
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000; //nanoseconds to seconds
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS)); //Compound interest formula
    startTime := currentTime;
  };

}

//LONG LIVE COMPOUND INTEREST!)


//1.Split Terminal:
//dfx start (--clean)

//2.Spkit Termina:
//dfx deploy
//npm start


//https://smartcontracts.org
//https://internetcomputer.org

//https://internetcomputer.org/docs/current/motoko/main/motoko
