async function selectMysteryCountry() {
    //const randomIndex = Math.floor(Math.random() * mysteryCountries.length);
    //return mysteryCountries[randomIndex];

    let numberOfCountries = 11;
    let randomId = Math.floor(Math.random() * numberOfCountries) + 1;
    console.log(randomId);
    const res = await fetch("http://localhost:5000/coordinates/" + randomId);
    const data = await res.json();
    console.log(data[0]);
    const { id, name, dms_e, dms_n } = data[0];
    console.log('mystery '+name);

    showPicture(id);
    return data[0];
}

function loadStariUnosi(guess, count, ispis1, ispis2) {

    document.getElementById("hint" + count).innerHTML = guess + " - Udaljenost = " + ispis1 + " km, smjer = " + ispis2;
}

function showPicture(id){
    document.getElementById("country").style = "height: 100px";
    document.getElementById("country").src = "/images/country" + id + ".png"
}

async function startGame() {
    let count = 2;
    let res = await fetch("http://localhost:5000/coordinates/names");
    let countryNames = await res.json();
    console.log(countryNames[0]);

    console.log('length'+countryNames.length)

    let len = countryNames.length;
    
    // Uzmemo random drzavu
    const mysteryCountry = await selectMysteryCountry();
    console.log(mysteryCountry['name']);

    let ispis1;
    let ispis2;
    let brojac = 0;
    let idMystery = mysteryCountry['id'];
    let eastMistery = parseFloat(mysteryCountry['dms_e']);
    let northMistery = parseFloat(mysteryCountry['dms_n']);
    console.log('id mystery = ' + idMystery + ', east = ' + eastMistery + ', north = ' + northMistery);

    const guessButton = document.getElementById("guess-button");
    guessButton.addEventListener("click", async () => {
        // Uzimamo igracev guess
        const guessInput = document.getElementById("guess-input");
        const guess = guessInput.value;
        const resultMessage = document.getElementById("result-message");
        let retry = false

        let countryExists = false;
        for(let  i=0; i<len; i++){
            const {name} = countryNames[i];
            console.log(name);
            if(guess.toLowerCase() === name.toLowerCase()) countryExists = true;
        }

        console.log(countryExists);

        if(!countryExists) resultMessage.innerText = "Ova država ne postoji u našoj bazi podataka. Molimo ponovite upis";
        
        else{
            let idGuess = 0;
            for(let  i=0; i<len; i++){
                const {name} = countryNames[i];
                console.log(name);
                if(guess.toLowerCase() === name.toLowerCase()) idGuess = i + 1;
            }
            let countryGuess = await (await fetch("http://localhost:5000/coordinates/" + idGuess)).json();
            let eastGuess = parseInt(countryGuess[0]['dms_e']);
            let northGuess = parseInt(countryGuess[0]['dms_n']);
            direction(northGuess,eastGuess,northMistery,eastMistery);
            if (guess.toLowerCase() === mysteryCountry.name.toLowerCase() && count <= 6) {
                // Ispis da je guess tocan
                resultMessage.innerText = "Točno! Tražena država je " + mysteryCountry.name;
                document.getElementById("guess-input").remove();
                document.getElementById("guess-button").remove();
                document.getElementById("direction").remove();
            } else {
                // Ispis da je guess kriv
                if (count < 7) {
                    count++;
                    
                    console.log(countryGuess[0]);
                    //const {id, name, dms_e, dms_n} = countryGuess[0];
                    //console.log(dms_e);
                    console.log(countryGuess[0]['dms_n']);

                    console.log('id drzave = ' + idGuess + ', east = ' + eastGuess + ', north = ' + northGuess);
                    console.log(typeof(eastGuess));

                    console.log('dis = ' + haversine(northGuess,eastGuess,northMistery,eastMistery));


                    resultMessage.innerText = "Netočno. Udaljenost = " + (haversine(northGuess,eastGuess,northMistery,eastMistery)/1000).toFixed(2) + "km, smjer = " + direction(northGuess,eastGuess,northMistery,eastMistery) + ". Pokušaj ponovo.";
                    ispis1 = (haversine(northGuess,eastGuess,northMistery,eastMistery)/1000).toFixed(2);
                    ispis2 = direction(northGuess,eastGuess,northMistery,eastMistery);
                    brojac++;
                    loadStariUnosi(guess, brojac, ispis1, ispis2);
                    document.getElementById("guess-input").value = "";
                    
                }
                else{
                    ispis1 = (haversine(northGuess,eastGuess,northMistery,eastMistery)/1000).toFixed(2);
                    ispis2 = direction(northGuess,eastGuess,northMistery,eastMistery);
                    brojac++;
                    loadStariUnosi(guess, brojac, ispis1, ispis2);
                    document.getElementById("hint6").value="lol"
                    resultMessage.innerText = "Izgubili ste, točna država je bila " + mysteryCountry.name;
                    document.getElementById("guess-input").remove()
                    document.getElementById("guess-button").remove()
                    
                }
                
            }
           
        }
    });
}

function haversine(lat1, lon1, lat2, lon2) {
    const toRadians = (angle) => angle * (Math.PI / 180);
    const R = 6371e3; 
    const latAngle1 = toRadians(lat1);
    const latAngle2 = toRadians(lat2);
    const latDiff = toRadians(lat2 - lat1);
    const lonDiff = toRadians(lon2 - lon1);
  
    const a = Math.sin(latDiff / 2) * Math.sin(latDiff / 2) +
              Math.cos(latAngle1) * Math.cos(latAngle2) *
              Math.sin(lonDiff / 2) * Math.sin(lonDiff / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  
    const distance = R * c;
    return distance;
  
}

function direction(lat1, lon1, lat2, lon2){
    let dlat = lat2 - lat1;
    let dlon = lon2 - lon1;

    console.log('guess = ' + lat1 + ', ' + lon1);
    console.log('mystery = ' + lat2 + ', ' + lon2);

    let angle = Math.atan2(dlat,dlon) * 180/Math.PI;
    console.log('angle = ' + angle);


    let dir = '';
if(angle < -157.5){
    dir = 'W';
    document.getElementById("direction").src = "images/lijevo.png"
}
else if(angle < -112.5){
    dir = 'SW';
    document.getElementById("direction").src = "images/dolje_lijevo.png"
}
else if(angle < -67.5){
    dir = 'S';
    
    document.getElementById("direction").src = "images/dolje.png"
}
else if(angle < -22.5){
    dir = 'SE';
    document.getElementById("direction").src = "images/dolje_desno.png"
}
else if(angle < 22.5){
    dir = 'E';
    document.getElementById("direction").src = "images/desno.png"
}
else if(angle < 67.5){
    dir = 'NE';
    document.getElementById("direction").src = "images/gore_desno.png"
}
else if(angle < 112.5){
    dir = 'N';
    document.getElementById("direction").src = "images/gore.png"
}
else if(angle < 157.5){
    dir = 'NW';
    document.getElementById("direction").src = "images/gore_lijevo.png"
}
else{
    dir = 'W';
    document.getElementById("direction").src = "images/lijevo.png"
}


    console.log('dir = ' + dir);

    return dir;
}

window.addEventListener("load", startGame);