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

let nev = document.getElementById("nev");
let login = document.getElementById("login");
let hiba = document.getElementById("hiba");

login.addEventListener("click", function(){
    if (nev.value.trim() === "" || jelszo.value.trim() === "" ){
        hiba.innerText = "Minden mezőt töltsön ki!";
    }
    else{
        hiba.innerText = "";
    }
})