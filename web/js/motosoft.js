document.addEventListener("DOMContentLoaded", function () {
    const menuIcon = document.getElementById("menu-icon");
    const menuItems = document.getElementById("menu-items");

    menuIcon.addEventListener("click", function () {
        menuItems.classList.toggle("open");
    });
});
