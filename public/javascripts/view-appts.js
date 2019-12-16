document.addEventListener("DOMContentLoaded", () => {
  const viewAppts = document.querySelector("#view-user-appointments");

  if (viewAppts) {
    viewAppts.addEventListener("click", e => {
      e.preventDefault();

      window.location = "/my-bookfit-appts";
    });
  }

  const cancelAppt = document.querySelectorAll(".cancel-appt");

  if (cancelAppt) {
    cancelAppt.forEach(button => {
      button.addEventListener("click", e => {
        e.preventDefault();

        const apptId = button.getAttribute("data-appointment");

        const dataObj = {
          appt_id: apptId
        };

        $.ajax({
          method: "DELETE",
          url: "api/user/appt-cancel",
          data: dataObj
        }).then(response => {
          $("#cancel-modal").modal("show");
          window.location = "/my-bookfit-appts";
            // $(".cancel-button").on("click", e => {
            //     e.preventDefault();
            //     window.location.reload(true);
            // })
          
        });
      });
    });
  }
});
