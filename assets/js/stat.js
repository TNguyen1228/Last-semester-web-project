const search = document.querySelector('.input-group input'),
    table_rows = document.querySelectorAll('tbody tr'),
    table_headings = document.querySelectorAll('thead th');
if (search) {
    search.addEventListener('input', searchTable);
}

function searchTable() {
    let matchedRows = [];
    table_rows.forEach((row, i) => {
        let table_data = row.textContent.toLowerCase(),
            search_data = search.value.toLowerCase();
        const isMatch = table_data.indexOf(search_data) >= 0;
        row.style.display = isMatch ? '' : 'none';
        row.style.setProperty('--delay', isMatch ? matchedRows.length / 25 + 's' : '');
        if (isMatch) {
            matchedRows.push(row);
        }
    });

    
    const tbody = document.querySelector('tbody');
    tbody.innerHTML = ''; 

    matchedRows.forEach((matchedRow) => {
        tbody.appendChild(matchedRow); 
    });
    document.querySelectorAll('tbody tr:not(.hide)').forEach((visible_row, i) => {
        visible_row.style.backgroundColor = (i % 2 == 0) ? 'transparent' : '#0000000b';
    });
}
table_headings.forEach((head, i) => {
    let sort_asc = true;
    head.onclick = () => {
        table_headings.forEach(head => head.classList.remove('active'));
        head.classList.add('active');
        document.querySelectorAll('td').forEach(td => td.classList.remove('active'));
        table_rows.forEach(row => {
            row.querySelectorAll('td')[i].classList.add('active');
        })
        head.classList.toggle('asc', sort_asc);
        sort_asc = head.classList.contains('asc') ? false : true;
        sortTable(i, sort_asc);
    }
})
function sortTable(column, sort_asc) {
    [...table_rows].sort((a, b) => {
        let first_row = a.querySelectorAll('td')[column].textContent.toLowerCase(),
            second_row = b.querySelectorAll('td')[column].textContent.toLowerCase();

        
        const firstValue = isNaN(parseFloat(first_row)) ? first_row : parseFloat(first_row);
        const secondValue = isNaN(parseFloat(second_row)) ? second_row : parseFloat(second_row);

        
        return sort_asc ? (firstValue > secondValue ? 1 : -1) : (firstValue < secondValue ? 1 : -1);
    })
    .map(sorted_row => document.querySelector('tbody').appendChild(sorted_row));
}
const deleteButton = document.querySelector('#deleteButton');
const confirmModal = document.querySelector('#confirmModal');

document.addEventListener("DOMContentLoaded", function () {
    const newStaffButton = document.querySelector('#newStaffButton');
    if (newStaffButton) {
        newStaffButton.addEventListener('click', function () {
            window.location.href = '/new-employee';
        });
    }
});

function validateForm(event) {
    var idValue = document.getElementById('new_id').value;
    var idPattern = /^ID_\d{1,6}$/;
    if (!idPattern.test(idValue)) {
        showErrorPopup("The ID is not in the ID_(number) form");
        event.preventDefault();
        return;
    }
}
function showErrorPopup(message) {
    var errorPopup = document.getElementById('error-popup');
    var errorMessage = document.getElementById('error-message');
    errorMessage.innerHTML = message;
    errorPopup.style.display = 'block';
}

function closeErrorPopup() {
    var errorPopup = document.getElementById('error-popup');
    errorPopup.style.display = 'none';
}