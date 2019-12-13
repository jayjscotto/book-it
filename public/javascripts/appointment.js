document.addEventListener("DOMContentLoaded", () => {
  const pageDate = document.querySelector(".date");
  const fullDate = moment().format("dddd, MMMM Do YYYY");

  pageDate.textContent = `Today's Date is: ${fullDate}`;

  //returns array
  const buttons = document.querySelectorAll(".appointment-modal");

  //assign event listener to each button and get data from API
  buttons.forEach(button =>
    button.addEventListener("click", e => {
      e.preventDefault();

      //class ID of facility class button
      const classId = e.target.getAttribute("data-id");
      console.log(classId);
      $.get("/api/class-info/" + classId).then(data => {
        console.log(data);
        //select modal elements for data entry
        const title = document.getElementById("modal-class-title");
        const startTime = document.getElementById("modal-class-time");
        const classCost = document.getElementById("modal-class-cost");
        const classDateModal = document.getElementById("modal-class-date");

        //data entry for modal from DB response
        title.textContent = data[0].class_name;

        //class start time moment formatting
        const classTime = moment(data[0].start_time, "H").format("h:mm a");
        startTime.textContent = classTime;

        //class cost
        classCost.textContent = `Drop-in Rate: $${data[0].cost}`;

        //get day of week from db and subtract by 1 for moment formatting
        let dbClassDay = data[0].day_of_week;

        const classDateGen = (goalDay, todayDate) => {
            // if we haven't yet passed the day of the week 
            if (todayDate <= goalDay) { 
                // then just give me this week's instance of that day
                return moment().isoWeekday(goalDay).format("dddd, MMMM Do YYYY");
            } else {
                // otherwise, give me *next week's* instance of that same day
                return moment().add(1, 'weeks').isoWeekday(goalDay).format("dddd, MMMM Do, YYYY");
            }
        }
        
        //database's class day + 1
        //DB class day's are 0 - 6, Moment days are 1 - 7
        const dayINeed = data[0].day_of_week + 1;
        //today's date
        const today = moment().isoWeekday();

        //append class date to date area in modal
        classDateModal.textContent = `${classDateGen(dayINeed, today)} at ${classTime}`;
      });
    })
  );
});

const getClassDate = () => {};
