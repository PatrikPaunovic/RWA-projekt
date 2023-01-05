//<script src="/database-access/server/index.js"></script>

//const { response } = require("express");

// Define an array of objects representing the mystery countries and their clues
const mysteryCountries = [
    {
        name: "Brazil",
        clues: ["The largest country in South America", "Home to the Amazon rainforest", "Known for soccer and carnivals"]
    },
    {
        name: "Russia",
        clues: ["The largest country in the world by land area", "Located in both Europe and Asia", "Capital is Moscow"]
    },
    {
        name: "Australia",
        clues: ["A country and continent located in the southern hemisphere", "Home to the Great Barrier Reef and the Outback", "Capital is Canberra"]
    }
];



// Define a function to select a random mystery country from the array
async function selectMysteryCountry() {
    //const randomIndex = Math.floor(Math.random() * mysteryCountries.length);
    //return mysteryCountries[randomIndex];

    let numberOfCountries = 11;
    let randomId = Math.floor(Math.random() * numberOfCountries) + 1;
    console.log(randomId);
    const res = await fetch("http://localhost:5000/countries/" + randomId);
    const data = await res.json();
    console.log(data[0]);
    const { id, name, hint_1, hint_2, hint_3, hint_4, hint_5 } = data[0];
    console.log(name);

    return data[0];
}

function loadHints(mysteryCountry) {
    document.getElementById("hint1").innerHTML = '1. ' + mysteryCountry['hint_1'];
    document.getElementById("hint2").innerHTML = '2. ' + mysteryCountry['hint_2'];
    document.getElementById("hint3").innerHTML = '3. ' + mysteryCountry['hint_3'];
    document.getElementById("hint4").innerHTML = '4. ' + mysteryCountry['hint_4'];
    document.getElementById("hint5").innerHTML = '5. ' + mysteryCountry['hint_5'];
}

// Define a function to start the game
async function startGame() {
    let count = 2;
    
    // Select a random mystery country
    const mysteryCountry = await selectMysteryCountry();
    console.log(mysteryCountry['hint_1']);

    loadHints(mysteryCountry);

    document.getElementById("hint1").style.display = 'block';
    /*document.getElementById("hint2").style.display = 'block';
    document.getElementById("hint3").style.display = 'block';
    document.getElementById("hint4").style.display = 'block';
    document.getElementById("hint5").style.display = 'block';*/


    // Display the clues for the mystery country
    /*const cluesList = document.getElementById("clues-list");
    cluesList.innerHTML = ""; // Clear any existing clues
    for (const clue of mysteryCountry.clues) {
        const clueItem = document.createElement("li");
        clueItem.innerText = clue;
        cluesList.appendChild(clueItem);
    }*/

    // Set up event listener for the guess button
    const guessButton = document.getElementById("guess-button");
    guessButton.addEventListener("click", () => {
        // Get the player's guess from the input field
        const guessInput = document.getElementById("guess-input");
        const guess = guessInput.value;
        const resultMessage = document.getElementById("result-message");
        let retry = false
        // Check if the guess is correct
        if (guess.toLowerCase() === mysteryCountry.name.toLowerCase() && count < 6) {
            // Display a message indicating that the guess is correct
            resultMessage.innerText = "Correct! The mystery country is " + mysteryCountry.name;
        } else {
            // Display a message indicating that the guess is incorrect
            if (count < 6) {
                //const nextHint = document.getElementById(`hint${count}`);
               // nextHint.style.display = 'block';
               const nextHint = document.getElementById('clues-list');
               nextHint.innerHTML += count+ ". " + mysteryCountry['hint_'+count] + "<br>";
                count++;
            resultMessage.innerText = "Incorrect. Please try again.";
            }
            else{
                resultMessage.innerText = "Izgubili ste, točna država je bila " + mysteryCountry.name;
                //retry provjerava ako je izgubio da se moze stvoriti button za restartanje igre
                retry = true;
            }
            
        }
        if(retry == true){
            document.getElementById('retry').innerHTML = "<button> Retry </button>";
        }
    });
}

// Start the game when the page loads
window.addEventListener("load", startGame);
const links = document.querySelectorAll('a[href^="#"]');

