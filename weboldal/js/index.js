const menuBtn = document.getElementById("menuBtn");
const menu = document.querySelector("ul");

// menut ezzel nyitod/csukod
menuBtn.addEventListener("click", (event) => {
    event.stopPropagation();
    menu.classList.toggle("open");
});

// ha a menün kivül kattintunk akkor is becsukódjon a menü
document.addEventListener("click", (event) => {
    const clickedInsideMenu = menu.contains(event.target);

    if (!clickedInsideMenu) {
    menu.classList.remove("open");
    }
});