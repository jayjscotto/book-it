$(function(){

    $(document).on('click', '.appointment-modal', function(e) {
        const classId = e.target.getAttribute('data-id');
       
        $.get('/api/class-info/' + classId).then((data) => {  
            console.log(data);
        });;
    })
    
});