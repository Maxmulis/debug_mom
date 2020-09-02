const accordionAnimation = () => {

  var acc = document.getElementsByClassName('accordion-dashboard');
  var i;

  for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
      this.classList.toggle("active");
      var panel = this.nextElementSibling;
      if (panel.style.maxHeight) {
        panel.style.maxHeight = null;
      } else {
        console.log(panel.scrollHeight);
        panel.style.maxHeight = panel.scrollHeight + "px";
      }
    });
  }
};

export { accordionAnimation };

