$(function() {
  const classDateGen = (goalDay, todayDate) => {
    // if we haven't yet passed the day of the week
    if (todayDate <= goalDay) {
      // then just give me this week's instance of that day
      return moment()
        .isoWeekday(goalDay)
        .format("dddd, MMMM Do YYYY");
    } else {
      // otherwise, give me *next week's* instance of that same day
      return moment()
        .add(1, "weeks")
        .isoWeekday(goalDay)
        .format("dddd, MMMM Do, YYYY");
    }
  };
  
  // //returns array
  // const buttons = document.querySelectorAll(".appointment-modal");

  // //assign event listener to each button and get data from API
  // buttons.forEach(button => {
  //   button.addEventListener("click", e => {
  //     e.preventDefault();
      
      $(".appointment-modal").on("click", e => {
        //class ID of facility class button
        const classId = e.target.getAttribute("data-id");

        $.get("/api/class-info/" + classId).then(data => {

          //database's class day + <i class="fas fa-repeat-1    "></i>
          //DB class day's are 0 - 6, Moment days are 1 - 7
          const dayINeed = data[0].day_of_week + 1;
          
          //today's date
          const today = moment().isoWeekday();
          //date of appointment
          const apptDate = classDateGen(dayINeed, today);
          //id of class in DB
          const serviceId = data[0].id;

          // console.log(dayINeed)
          // console.log(apptDate);
          // console.log(data);

          //select modal elements for data entry
          const title = $("#modal-class-title");
          const startTime = $("#modal-class-time");
          const classCost = $("#modal-class-cost");
          const classDateModal = $("#modal-class-date");

          //data entry for modal from DB response
          title.text(data[0].class_name);
          
          //class start time moment formatting
          const classTime = moment(data[0].start_time, "H").format("h:mm a");
          startTime.text(classTime);

          //class cost
          classCost.text(`Drop-in Rate: $${data[0].cost}`);

          //append class date to date area in modal
          classDateModal.text(`${apptDate} at ${classTime}`);

          // //assign class ID to bookFit button for db query
          // const bookButton = document.querySelector(
          //   ".modal #book-appointment-final"
          // );
          //bookButton.addEventListener("click", e => {
            
          $(".modal #book-appointment-final").on("click", e => {
          
            e.stopPropagation();
            e.preventDefault();

            const apptObj = {
              service_id: serviceId,
              appt_date: apptDate
            };

          //booking gif

          $.ajax({
            type: "POST",
            url: "/api/book-appointment",
            data: apptObj
          })
            .then(function(results) {
              $(".confirmation-body").empty();
              //dynamically confirm appointment's been booked
              $("#modal").modal("hide");

              const confirmation = $("<h4>").text("Appointment booked!");

              $(".confirmation-body").append(confirmation);
              $("#confirmation-modal").modal("show");
            })
            .catch(function(err) {
              $(".confirmation-body").empty();
              //dynamically advise the user already has an appointment at that time
              $("#modal").modal("hide");

              const errorMessage = $("<h4>").text(err.message);

              $(".confirmation-body").append(message);
              
              $("#confirmation-modal").modal("show");
              console.log(err);
            });
        });
      });
    });
  });
