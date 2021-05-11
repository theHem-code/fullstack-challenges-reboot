import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["trigger"];
  connect() {
    console.log("The Zelda controller is now loaded!");
    this.originalTriggerText = this.triggerTarget.innerText;
  }
  play() {
    const sound = new Audio(this.data.get("sound"));
    sound.play();
    this.triggerTarget.innerText = "Bingo!";
    this.triggerTarget.setAttribute("disabled", "");
    sound.addEventListener("ended", () => {
      this.triggerTarget.removeAttribute("disabled");
      this.triggerTarget.innerText = this.originalTriggerText;
    });
  }
}
