import { Controller } from "stimulus";

export default class extends Controller {
  toggleForm() {
    this.data.set("toggled", !this.toggled);
    this.element.classList.toggle("toggled");
  }

  get toggled() {
    return this.data.get("toggled");
  }
}
