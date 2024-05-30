import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-resa"
export default class extends Controller {
  static targets = ["start", "end","total","price"]
  connect() {
    console.log(this.element.dataset.price);
    console.log(this.endTarget);
  }
calculate() {
const start = new Date(this.startTarget.value)
const end = new Date(this.endTarget.value)
const totalDays = (Math.abs(end - start))/(1000 * 3600 * 24)
const price = Number.parseInt(`${this.element.dataset.price}`, 10)
console.log(this.startTarget.value === "");
    if (this.startTarget.value === "" || this.endTarget.value === "") {
      this.totalTarget.innerHTML = `<div class="d-grid col-12 justify-content-center mt-5"><i class="fa-solid fa-spinner fa-2xl fa-spin"></i></div>` ;
    } else {
      this.totalTarget.innerHTML = `<div class="d-flex justify-content-between mt-4">Nombre de jours <div>${totalDays}</div></div> <div class="d-flex justify-content-between">Prix par jour <div>${price}€</div></div> <br> <div class="d-flex justify-content-between total">TOTAL <div><strong>${totalDays * price}€</strong></div></div>`;
    }
}
}
