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
function selectMysteryCountry() {
    const randomIndex = Math.floor(Math.random() * mysteryCountries.length);
    return mysteryCountries[randomIndex];
}

// Define a function to start the game
function startGame() {
    // Select a random mystery country
    const mysteryCountry = selectMysteryCountry();

    // Display the clues for the mystery country
    const cluesList = document.getElementById("clues-list");
    cluesList.innerHTML = ""; // Clear any existing clues
    for (const clue of mysteryCountry.clues) {
        const clueItem = document.createElement("li");
        clueItem.innerText = clue;
        cluesList.appendChild(clueItem);
    }

    // Set up event listener for the guess button
    const guessButton = document.getElementById("guess-button");
    guessButton.addEventListener("click", () => {
        // Get the player's guess from the input field
        const guessInput = document.getElementById("guess-input");
        const guess = guessInput.value;

        // Check if the guess is correct
        if (guess.toLowerCase() === mysteryCountry.name.toLowerCase()) {
            // Display a message indicating that the guess is correct
            const resultMessage = document.getElementById("result-message");
            resultMessage.innerText = "Correct! The mystery country is " + mysteryCountry.name;
        } else {
            // Display a message indicating that the guess is incorrect
            const resultMessage = document.getElementById("result-message");
            resultMessage.innerText = "Incorrect. Please try again.";
        }
    });
}

// Start the game when the page loads
window.addEventListener("load", startGame);
