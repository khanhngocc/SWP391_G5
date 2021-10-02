function sort(number) {
    var in_num, table, rows, switching, i, x, y, shouldSwitch;
    in_num = parseInt(number);
    table = document.getElementById("myTable");
    switching = true;
    while (switching) {
        switching = false;
        rows = table.rows;
        for (i = 1; i < rows.length - 1; i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("td")[in_num];
            y = rows[i + 1].getElementsByTagName("td")[in_num];
            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                shouldSwitch = true;
                break;
            }
        }
        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
        }
    }
}