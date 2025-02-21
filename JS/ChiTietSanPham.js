function changeImage(imageSrc) {
  document.getElementById("main-image").src = imageSrc;
}

function increment() {
  var quantityInput = document.getElementById("quantity");
  quantityInput.value = parseInt(quantityInput.value) + 1;
}

function decrement() {
  var quantityInput = document.getElementById("quantity");
  if (quantityInput.value > 1) {
    quantityInput.value = parseInt(quantityInput.value) - 1;
  }
}
