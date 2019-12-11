
document.addEventListener("DOMContentLoaded", function() {
  $(document).on('click', '.class-day-lookup', (e) => {
      e.preventDefault();
    //   e.target.attribute('id', 'btn-inverse')
      let classDay = e.target.getAttribute('data-day');
        console.log(classDay)
      $.get('/facilityId=:id/classes/' + classDay)
  })
});

    // append buttons for each Day
        // on click each button, queries db for classes at that facility on that day
    //append cla
