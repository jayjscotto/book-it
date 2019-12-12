$(function() {
    const locationSearchSubmit = $('#location-search-btn');


    locationSearchSubmit.on('click', (e) => {
        e.preventDefault();
        const locationSearchData = $('#facility-search').val();

        window.location = `/location-search/${locationSearchData}`
        //getSearchLocation(locationSearchData);
        
    });


    const classSearchSubmit = $('#class-search-btn');


    classSearchSubmit.on('click', (e) => {
        e.preventDefault();
        const classSearchData = $('#class-search').val();
        
        window.location = `/class-search/${classSearchData}`
        //getSearchLocation(locationSearchData);
        
    });
});
