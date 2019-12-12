$(function(e) {

    //returns array
    const buttons = document.querySelectorAll('.appointment-modal');

    //assign event listener to each button and get data from API
    buttons.forEach(button => button.addEventListener('click', e => {
        e.preventDefault();

        //class ID of facility class button
        const classId = e.target.getAttribute('data-id');
        console.log(classId)
        $.get('/api/class-info/' + classId)
            .then((data) => {
            
                console.log(data);

        });;
    }));    
});