function setsEvents() {
    const minhasDivs = document.querySelectorAll('.donation-each');
    minhasDivs.forEach(d => d.addEventListener('click', changesURL));
}

function changesURL(e) {
    const id = e.currentTarget.getAttribute('data-id');
    console.log(id);
    window.location += `donations/${id}`
}
setsEvents();
