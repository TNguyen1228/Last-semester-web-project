// Select all elements with class 'cbutton' (increase and decrease buttons)

document.querySelectorAll('.cbutton').forEach(button => {
  button.addEventListener('click', function (event) {
    const clickedButton = event.target;
    const countElement = clickedButton.parentElement.querySelector('.count');
    let count = parseInt(countElement.textContent);
    const productRow = clickedButton.closest('tr');
    const productName = productRow.querySelector('a').textContent;
    const productPrice = parseFloat(productRow.querySelectorAll('td')[2].textContent.slice(1)); // Extract price

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
    const roundedTotalPrice = totalPrice.toFixed(2);
    document.getElementById('total-price').textContent = `$${roundedTotalPrice}`;
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

  cartContainer.insertBefore(pElement, cartContainer.children[1]); // Insert before the <hr> element
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

// Function to clear the input field and phone display
function clearPhoneNumberInput() {
  // Clear the input field
  document.getElementById('phone-input').value = '';

  // Clear the displayed phone number
  const phoneDisplay = document.getElementById('phone-display');
  phoneDisplay.innerHTML = '';

  // Hide the clear button again
  document.getElementById('clear-button').style.display = 'none';
}

// Function to validate input and display phone number
function validateAndDisplay() {
  // Get the value entered in the phone input field
  const inputValue = document.getElementById('phone-input').value.trim();
  const phonePattern = /^\d{10,11}$/; // Matches 10 or 11 digits
  // Check if input is not empty or whitespace
  if (inputValue !== '' && phonePattern.test(inputValue)) {
    // Display the entered phone number
    displayPhoneNumber();

    // Show the clear button
    document.getElementById('clear-button').style.display = 'inline-block';
  } else {
    // Handle invalid phone number input (e.g., show error message)
    alert('Please enter a valid 10 or 11-digit phone number.'); // Change this based on your UI/UX design
  }
}

// Function to handle the "Enter" key press in the input field
document.getElementById("phone-input").addEventListener("keyup", function (event) {
  if (event.key === "Enter") {
    // Prevent the default Enter key action
    event.preventDefault();

    // Validate and display phone number
    validateAndDisplay();
  }
});

// Function to display the entered phone number
function displayPhoneNumber() {
  // Get the value entered in the phone input field
  const phoneNumber = document.getElementById('phone-input').value.trim();
  // Create a new element to display the phone number
  const phoneDisplay = document.getElementById('phone-display');
  const newElement = document.createElement('p');
  newElement.textContent = `Customer phone number: ${phoneNumber}`;
  // Clear the previous phone number display
  phoneDisplay.innerHTML = '';

  // Append the new element to the phone-display div
  phoneDisplay.appendChild(newElement);

}

// Function to send the phone number to the server and handle the response
function storeData() {
  const phoneNumber = document.getElementById('phone-input').value.trim();
  const cus_id= `ID_${phoneNumber}`
  const bill=parseFloat(document.getElementById('total-price').textContent.slice(1));
  if (phoneNumber !== '') {
    fetch('/store-customer-bill', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({customer_id: cus_id, phone: phoneNumber, total_spent:bill }),
    })
      .then(response => {
        if (!response.ok) {
          window.alert("Cart cannot be empty!")
          throw new Error('Cart empty!');
        } else{
          window.alert("Complete."); 
          window.location.reload();
          return response.json();
        }
      })
      .then(data => {
        // Handle the server response (data contains the name or relevant information)
        handleServerResponse(data);
        
      })
      .catch(error => {
        console.error('There was an error:', error);
      });
  }
}
// Function to handle the server response (update UI, display name, etc.)
function handleServerResponse(data) {
  // Assuming the server responds with a 'name' property
  const name = data.phone; // Adjust this based on the actual server response structure

  // Display the received name or perform other actions with it
  console.log('Received phone:', name);
}

document.addEventListener("DOMContentLoaded", function () {
  // Get the price element
  var priceElement = document.getElementById('total-price');

  // Define a variable to track the currency state
  var isUSD = true;

  // Function to handle the click event
  function handleClick() {
    // Get the current price value
    var currentPrice = priceElement.textContent;

    // Extract the numerical value (assuming it's in the format "$X" or "Vnd X")
    var numericValue = parseFloat(currentPrice.replace(/[^\d.]/g, '')); // Extracts the numeric value from the string

    // Toggle between USD and Vnd on each click
    if (isUSD) {
      // Convert the price to Vnd
      var convertedPrice = numericValue * 24348.67; // Assuming a conversion rate of 1 USD = 23000 Vnd
      priceElement.textContent = 'VND ' + convertedPrice.toFixed(2); // Update the price text to Vnd format
    } else {
      // Convert the price back to USD
      var convertedPrice = numericValue / 24348.67; // Assuming a conversion rate of 1 USD = 23000 Vnd
      priceElement.textContent = '$' + convertedPrice.toFixed(2); // Update the price text to USD format
    }

    // Toggle the currency state
    isUSD = !isUSD;
  }

  // Attach the click event listener
  priceElement.addEventListener('click', handleClick);
});

