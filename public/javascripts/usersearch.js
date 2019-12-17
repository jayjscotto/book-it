$(function() {
    const locationSearchSubmit = $('#user-search-form');


    locationSearchSubmit.on('submit', (e) => {
        e.preventDefault();
        const locationSearchData = $('#facility-search').val();

        window.location = `/location-search/${locationSearchData}`
        //getSearchLocation(locationSearchData);
        
    });
});
