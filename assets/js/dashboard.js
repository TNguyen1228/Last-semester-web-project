let navOpen = false;
function toggleNav() {
    const sidebar = document.getElementById("mySidebar");
    const mainContent = document.querySelector("main");
    if (sidebar && mainContent) {
        if (!navOpen) {
            
            sidebar.style.width = "250px";
            mainContent.style.marginLeft = "250px";

            navOpen = true;
        } else {
            
            sidebar.style.width = "0";
            mainContent.style.marginLeft = "0";
            navOpen = false;
        }
    }
}

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
    })
        .then(response => {
            
            if (response.ok) {
                
                window.location.href = '/login';
            }
        })
        .catch(error => {
            console.error('Error during logout:', error);
            
        });
});