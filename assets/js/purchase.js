

document.querySelectorAll('.cbutton').forEach(button => {
  button.addEventListener('click', function (event) {
    const clickedButton = event.target;
    const countElement = clickedButton.parentElement.querySelector('.count');
    let count = parseInt(countElement.textContent);
    const productRow = clickedButton.closest('tr');
    const productName = productRow.querySelector('a').textContent;
    const productPrice = parseFloat(productRow.querySelectorAll('td')[2].textContent.slice(1));

    if (clickedButton.classList.contains('increase')) {
      count++;
      createCartItem(productName, productPrice);
    } else if (clickedButton.classList.contains('decrease') && count > 0) {
      count--;
      removeCartItem(productName);
    }

    countElement.textContent = count;

    const quantityValue = document.querySelectorAll('.count');
    const totalPrice = Array.from(quantityValue).reduce((total, element) => {
      const price = parseFloat(element.parentElement.previousElementSibling.textContent.slice(1));
      const quantity = parseInt(element.textContent);
      return total + (price * quantity);
    }, 0);
    document.getElementById('total-price').textContent = `$${totalPrice.toFixed(2)}`;
    const numProduct = document.querySelectorAll('.container .product');
    document.getElementById('cart-total').textContent = numProduct.length.toString();
  });
});
function createCartItem(productName, productPrice) {
  const cartContainer = document.getElementById('cart-container');
  const pElement = document.createElement('p');
  const aElement = document.createElement('a');
  const spanElement = document.createElement('span');

  aElement.textContent = productName;
  spanElement.textContent = `$${productPrice}`;
  spanElement.classList.add('price');
  pElement.appendChild(aElement);
  pElement.appendChild(spanElement);
  pElement.classList.add('product');

  cartContainer.insertBefore(pElement, cartContainer.children[1]);
}
function removeCartItem(productName) {
  const cartItems = document.querySelectorAll('.container p');
  for (let i = 0; i < cartItems.length; i++) {
    const item = cartItems[i];
    if (item.querySelector('a').textContent === productName) {
      item.remove();
      break;
    }
  }
  ;
}


function clearPhoneNumberInput() {

  document.getElementById('phone-input').value = '';


  const phoneDisplay = document.getElementById('phone-display');
  phoneDisplay.innerHTML = '';


  document.getElementById('clear-button').style.display = 'none';
}


function validateAndDisplay() {

  const inputValue = document.getElementById('phone-input').value.trim();
  const phonePattern = /^\d{10,11}$/;

  if (inputValue !== '' && phonePattern.test(inputValue)) {

    displayPhoneNumber();


    document.getElementById('clear-button').style.display = 'inline-block';
  } else {

    alert('Please enter a valid 10 or 11-digit phone number.');
  }
}


document.getElementById("phone-input").addEventListener("keyup", function (event) {
  if (event.key === "Enter") {

    event.preventDefault();


    validateAndDisplay();
  }
});


function displayPhoneNumber() {

  const phoneNumber = document.getElementById('phone-input').value.trim();

  const phoneDisplay = document.getElementById('phone-display');
  const newElement = document.createElement('p');
  newElement.textContent = `Customer phone number: ${phoneNumber}`;

  phoneDisplay.innerHTML = '';


  phoneDisplay.appendChild(newElement);

}


function storeData() {
  const phoneNumber = document.getElementById('phone-input').value.trim();
  const cus_id = `ID_${phoneNumber}`
  const bill = parseFloat(document.getElementById('total-price').textContent.slice(1));
  if (phoneNumber !== '') {
    fetch('/store-customer-bill', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ customer_id: cus_id, phone: phoneNumber, total_spent: bill }),
    })
      .then(response => {
        if (!response.ok) {
          window.alert("Cart cannot be empty!")
          throw new Error('Cart empty!');
        } else {
          window.alert("Complete.");
          window.location.reload();
          return response.json();
        }
      })
      .then(data => {

        handleServerResponse(data);

      })
      .catch(error => {
        console.error('There was an error:', error);
      });
  }
}

function handleServerResponse(data) {

  const name = data.phone;


  console.log('Received phone:', name);
}

document.addEventListener("DOMContentLoaded", function () {

  var priceElement = document.getElementById('total-price');


  var isUSD = true;


  function handleClick() {

    var currentPrice = priceElement.textContent;


    var numericValue = parseFloat(currentPrice.replace(/[^\d.]/g, ''));


    if (isUSD) {

      var convertedPrice = numericValue * 24348.67;
      priceElement.textContent = 'VND ' + convertedPrice.toFixed(2);
    } else {

      var convertedPrice = numericValue / 24348.67;
      priceElement.textContent = '$' + convertedPrice.toFixed(2);
    }


    isUSD = !isUSD;
  }


  priceElement.addEventListener('click', handleClick);
});

