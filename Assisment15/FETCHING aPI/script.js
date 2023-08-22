async function fetchinfo() {
  //const response = await 
  fetch("https://restcountries.com/v3.1/all")
  .then(function(data){
    console.log(data)
    return data.json()
  })
  .then(function(data){})
  .catch(error =>console.error(error))
  
  //const countryname = await response.json();
  //console.log(countryname);
}