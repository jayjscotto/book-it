document.addEventListener("DOMContentLoaded", () => {
  const viewAppts = $("#view-user-appointments");

  if (viewAppts) {
    viewAppts.on("click", e => {
      e.preventDefault();

      window.location = "/my-bookfit-appts";
    });
  }

  const cancelAppt = $(".cancel-appt");

  if (cancelAppt) {
    //cancelAppt.forEach(button => {
    //button.addEventListener("click", e => {
    $(".cancel-appt").on("click", e => {
      e.preventDefault();

      const apptId = e.target.getAttribute("data-appointment");

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
      });
    });
  }
});
