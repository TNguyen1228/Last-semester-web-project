let navOpen = false;
function toggleNav() {
    const sidebar = document.getElementById("mySidebar");
    const mainContent = document.querySelector("main");
    if (sidebar && mainContent) {
        if (!navOpen) {
            // If the navigation is closed, open it
            sidebar.style.width = "250px";
            mainContent.style.marginLeft = "250px";
            document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
            navOpen = true;
        } else {
            // If the navigation is open, close it
            sidebar.style.width = "0";
            mainContent.style.marginLeft = "0";
            document.body.style.backgroundColor = "white";
            navOpen = false;
        }
    }
}

function dropDownList() {
    document.getElementById("dropdownTable").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function (event) {
    if (!event.target.matches('.dropbtn')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}
document.querySelector('.logout-btn').addEventListener('click', function () {
    fetch('/logout', {
        method: 'GET'
        // You can add headers or other configurations as needed
    })
        .then(response => {
            // Handle response if needed (e.g., check status code)
            if (response.ok) {
                // Redirect to login page or any desired page after logout
                window.location.href = '/login';
            }
        })
        .catch(error => {
            console.error('Error during logout:', error);
            // Handle network errors or other exceptions
        });
});