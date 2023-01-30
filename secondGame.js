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

    return data[0];
}

async function startGame() {
    let count = 2;
    let res = await fetch("http://localhost:5000/coordinates/names");
    let countryNames = await res.json();
    console.log(countryNames[0]);

    console.log('length'+countryNames.length)

    let len = countryNames.length;
    
    // Select a random mystery country
    const mysteryCountry = await selectMysteryCountry();
    console.log(mysteryCountry['name']);

    let idMystery = mysteryCountry['id'];
    let eastMistery = parseFloat(mysteryCountry['dms_e']);
    let northMistery = parseFloat(mysteryCountry['dms_n']);
    console.log('id mystery = ' + idMystery + ', east = ' + eastMistery + ', north = ' + northMistery);

    const guessButton = document.getElementById("guess-button");
    guessButton.addEventListener("click", async () => {
        // Get the player's guess from the input field
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

        if(!countryExists) resultMessage.innerText = "This country doesn't exists in our database. Please try again.";
        else{
            if (guess.toLowerCase() === mysteryCountry.name.toLowerCase() && count <= 6) {
                // Display a message indicating that the guess is correct
                resultMessage.innerText = "Correct! The mystery country is " + mysteryCountry.name;
            } else {
                // Display a message indicating that the guess is incorrect
                if (count < 6) {
                    count++;
                    

                    let idGuess = 0;
                    for(let  i=0; i<len; i++){
                        const {name} = countryNames[i];
                        console.log(name);
                        if(guess.toLowerCase() === name.toLowerCase()) idGuess = i + 1;
                    }
                    //console.log('id drzave = '+idGuess);

                    let countryGuess = await (await fetch("http://localhost:5000/coordinates/" + idGuess)).json();
                    console.log(countryGuess[0]);
                    //const {id, name, dms_e, dms_n} = countryGuess[0];
                    //console.log(dms_e);
                    console.log(countryGuess[0]['dms_n']);

                    let eastGuess = parseInt(countryGuess[0]['dms_e']);
                    let northGuess = parseInt(countryGuess[0]['dms_n']);
                    console.log('id drzave = ' + idGuess + ', east = ' + eastGuess + ', north = ' + northGuess);
                    console.log(typeof(eastGuess));

                    console.log('dis = ' + haversine(northGuess,eastGuess,northMistery,eastMistery));

                    direction(northGuess,eastGuess,northMistery,eastMistery);

                    resultMessage.innerText = "Incorrect. Distance = " + (haversine(northGuess,eastGuess,northMistery,eastMistery)/1000).toFixed(2) + "km, dir = " + direction(northGuess,eastGuess,northMistery,eastMistery) + ". Please try again.";
                }
                else{
                    resultMessage.innerText = "Izgubili ste, točna država je bila " + mysteryCountry.name;
                    //retry provjerava ako je izgubio da se moze stvoriti button za restartanje igre
                    retry = true;
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
    }
    else if(angle < -112.5){
        dir = 'SW';
    }
    else if(angle < -67.5){
        dir = 'S';
    }
    else if(angle < -22.5){
        dir = 'SE';
    }
    else if(angle < 22.5){
        dir = 'E';
    }
    else if(angle < 67.5){
        dir = 'NE';
    }
    else if(angle < 112.5){
        dir = 'N';
    }
    else if(angle < 157.5){
        dir = 'NW';
    }
    else{
        dir = 'W';
    }

    console.log('dir = ' + dir);

    return dir;
}

window.addEventListener("load", startGame);