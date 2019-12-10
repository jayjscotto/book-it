$(document).ready(function() {
    const locationSearchSubmit = $('#location-search-btn');
    const locationSearchData = $('#location-search-submit').val().trim();

    locationSearchSubmit.on('click', (e) => {
        e.preventDefault();

        window.location = "/location-search" + locationSearchData;
        //getSearchLocation(locationSearchData);
        
    });
});
