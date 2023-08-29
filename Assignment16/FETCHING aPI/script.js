const searchButton = document.getElementById("search-button");
const searchInput = document.getElementById("search-input");
const countryContainer = document.getElementById("country-container");

let cachedData = []; 

searchButton.addEventListener("click", () => {
    const query = searchInput.value.trim();
    if (query !== "") {
        fetchCountryData(query);
    }
});

async function fetchCountryData(query) {
    try {
        const response = await fetch(`https://restcountries.com/v3.1/name/${query}`);
        const data = await response.json();
        if (data.status === 404) {

            fetchCountryByCurrency(query);
            return;
        }
        cachedData = data;
        const country = data[0];
        const countryCard = createCountryCard(country);

        clearCountryContainer();

        countryContainer.appendChild(countryCard);

    } catch (error) {
        console.error("Error fetching country data:", error);
    }

}

async function fetchCountryByCurrency(query) {

    try {
        const response = await fetch(`https://restcountries.com/v3.1/currency/${query}`);
        const data = await response.json();
        if (data.status === 404) {
            displayErrorMessage("No results found.");
            return;
        }

        cachedData = data;
        const country = data[0];

        const countryCard = createCountryCard(country);

        clearCountryContainer();

        countryContainer.appendChild(countryCard);

    } catch (error) {
        console.error("Error fetching country data:", error);
    }

}

function createCountryCard(country) {

    const countryCard = document.createElement("div");
    countryCard.classList.add("country-card");
    countryCard.innerHTML = `

        <img src="${country.flags.png}" alt="${country.name.common} Flag">
        ${country.name.common}</h2>
        Capital: ${country.capital}</p>

        <p>Population: ${country.population}</p>

    `;
    return countryCard;
}



function clearCountryContainer() {
    countryContainer.innerHTML = "";
}



function displayErrorMessage(message) {
    const errorCard = document.createElement("div");
    errorCard.classList.add("error-card");

    errorCard.textContent = message;
    clearCountryContainer();

    countryContainer.appendChild(errorCard);

}