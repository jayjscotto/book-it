
document.addEventListener("DOMContentLoaded", function() {

  $(document).on('click', '.class-day-lookup', function(e) {
      e.preventDefault();
    //   e.target.attribute('id', 'btn-inverse')
    
    //data attributes for URL
      const classDay = e.target.getAttribute('data-day');
      const businessId = e.target.getAttribute('data-business');

     // $.get('facility/facilityId='+ businessId + '/classes/' + classDay);

      window.location.pathname = 'facility/facilityId=' + businessId +'/classes/' + classDay;
  });

});