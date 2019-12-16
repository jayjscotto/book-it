$(function() {
    const locationSearchSubmit = $('#user-search-form');


    locationSearchSubmit.on('submit', (e) => {
        e.preventDefault();
        const locationSearchData = $('#facility-search').val();
        const locationSearchParam = $("#facility-search-param").val();;

        window.location = `/location-search/${locationSearchParam}/${locationSearchData}`
        //getSearchLocation(locationSearchData);
        
    });
});
