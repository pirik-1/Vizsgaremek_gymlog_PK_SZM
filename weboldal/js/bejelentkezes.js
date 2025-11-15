let jelszo = document.getElementById("jelszo");
let mutasd = document.getElementById("mutasd");

mutasd.addEventListener("mouseover", function(){
    jelszo.type = "text";
    mutasd.style.color = "lightblue";
})
mutasd.addEventListener("mouseout", function(){
    jelszo.type = "password";
    mutasd.style.color = "white";
})



