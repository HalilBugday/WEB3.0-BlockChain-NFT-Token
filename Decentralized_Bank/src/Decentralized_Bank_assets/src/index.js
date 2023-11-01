import { Decentralized_Bank } from "../../declarations/Decentralized_Bank";

window.addEventListener("load", async function() {
  // console.log("Finished loading");
  update();
});

document.querySelector("form").addEventListener("submit", async function(event) {
  event.preventDefault();
  // console.log("Submitted.");

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  if (document.getElementById("input-amount").value.length != 0) {
    await Decentralized_Bank.topUp(inputAmount);
  }

  if (document.getElementById("withdrawal-amount").value.length != 0) {
    await Decentralized_Bank.withdrawl(outputAmount);
  }

  await Decentralized_Bank.compound();

  update()

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";

  button.removeAttribute("disabled");

});

async function update() {
  const currentAmount = await Decentralized_Bank.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
};


//1.Split Terminal:
//dfx start (--clean)

//2.Spkit Termina:
//dfx deploy
//npm start