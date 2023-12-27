function createBilItem(duration, price) {
    const cartContainer = document.getElementById('cart-container');
    const pElement = document.createElement('p');
    const aElement = document.createElement('a');
    const spanElement = document.createElement('span');
    var fixedDuration = duration.toFixed(2);
    aElement.textContent = `Karaoke Service`;
    spanElement.textContent = `${fixedDuration}hr x $${price}`;
    spanElement.classList.add('price');
    pElement.appendChild(aElement);
    pElement.appendChild(spanElement);
    pElement.classList.add('product');
    totalPrice = duration * price;
    cartContainer.insertBefore(pElement, cartContainer.children[1]);
    document.getElementById('total-price').textContent = `$${totalPrice.toFixed(1)}`;
}


function clearPhoneNumberInput() {

    document.getElementById('phone-input').value = '';


    const phoneDisplay = document.getElementById('phone-display');
    phoneDisplay.innerHTML = '';

}


function validateAndDisplay() {

    const inputValue = document.getElementById('phone-input').value.trim();
    const phonePattern = /^\d{10,11}$/;

    if (inputValue !== '' && phonePattern.test(inputValue)) {

        displayPhoneNumber();

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


function cleanRoom() {
    const phoneNumber = document.getElementById('phone-input').value.trim();
    const cus_id = `ID_${phoneNumber}`
    const bill = parseFloat(document.getElementById('total-price').textContent.slice(1));
    if (phoneNumber !== '') {
        fetch('/clean-room', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ customer_id: cus_id, phone: phoneNumber, total_spent: bill }),
        })
            .then(response => {
                if (!response.ok) {
                    window.alert("Bill cannot be empty!")
                    throw new Error('Bill empty!');
                } else {
                    window.alert("Complete.");
                    window.location.reload();
                    return response.json();
                }
            })
            .catch(error => {
                console.error('There was an error:', error);
            });
    }
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

document.addEventListener("DOMContentLoaded", function () {
    const roomElements = document.querySelectorAll('.room');
    let selectedRoom = null;

    roomElements.forEach(async function (room) {
        room.addEventListener("click", function () {

            if (selectedRoom !== null) {

                selectedRoom.classList.remove("selected");
                document.querySelector('p.product').remove();
            }

            if (selectedRoom !== room) {


                room.classList.add("selected");
                selectedRoom = room;
                fetch(`/get-room-details`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'

                    },
                    body: JSON.stringify({ room_number: room.textContent }),
                })
                    .then(response => {
                        if (response.ok) {

                            return response.json();
                        } else if (response.status === 404) {
                            return Promise.reject(new Error('Room not found'));
                        } else {
                            return Promise.reject(new Error('Server Error'));
                        }
                    })
                    .then(data => {
                        if (data.duration < 0) {
                            data.duration = 0;
                            const setTimeOut = window.confirm("Set time out?");
                            if (setTimeOut) {
                                fetch('/set-time-out', {
                                    method: 'PUT',
                                    headers: {
                                        'Content-Type': 'application/json'

                                    },
                                    body: JSON.stringify({ room_number: room.textContent }),
                                }).then(response => {
                                    if (response.ok) {
                                        window.location.reload();
                                    }
                                })
                            } else {
                                room.classList.remove("selected");
                                window.location.reload();
                            }
                        } else {

                            createBilItem(data.duration, data.price);

                        }

                    })
                    .catch(error => {
                        if (error.message === 'Room not found') {

                            const userInput = window.confirm("Room Empty! Set time in?");
                            if (userInput) {

                                fetch('/add-room-details', {
                                    method: 'POST',
                                    headers: {
                                        'Content-Type': 'application/json',
                                    },
                                    body: JSON.stringify({ room_number: room.textContent }),
                                }).then(response => {
                                    if (response.ok) {
                                        window.location.reload();
                                    }
                                })


                            } else {

                                room.classList.remove("selected");
                                window.location.reload();

                            }
                        } else {
                            console.error('Error:', error.message);

                        }
                    });
            } else {

                room.classList.remove("selected");

                selectedRoom = null;
                document.getElementById('total-price').textContent='';
                document.querySelector('p.product').remove();
                
            }
        });
    });
});

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
    if (!priceElement.hasEventListener('click', handleClick)) {
        priceElement.addEventListener('click', handleClick);
    }
});