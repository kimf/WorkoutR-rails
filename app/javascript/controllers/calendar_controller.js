import { Controller } from "stimulus";

const OFFSET = 400;
const left = 0;

export default class extends Controller {
  initialize() {
    this.today.scrollIntoView({ behavior: "instant" });
  }

  smoothScrollToToday() {
    this.today.scrollIntoView({
      behavior: "smooth"
    });
    // const top =
    //   this.today.getBoundingClientRect().top + window.pageYOffset - OFFSET;
    // this.wrapper.scroll({
    //   top,
    //   left: 0,
    //   behavior: "auto"
    // });
  }

  get wrapper() {
    return this.element.getElementsByClassName("calendar-wrapper")[0];
  }

  get today() {
    return this.wrapper.getElementsByClassName("today")[0];
  }
}
