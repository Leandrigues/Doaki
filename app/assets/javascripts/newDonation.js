$(function () {
    var imagesPreview = function (input, placeToInsertImagePreview) {
        if (input.files) {
            var filesAmount = input.files.length;

            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function (event) {
                    $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(placeToInsertImagePreview).attr('class', 'donation-image-form');
                }

                reader.readAsDataURL(input.files[i]);
            }
        }

    };

    let divContainer = `<div class="image-container-form">
                          </div>
                          `
    $('.file-field').on('change', function () {
        console.log('changed')
        $(divContainer).insertAfter('.file-field')
    })
    $('.file-field').on('change', function () {
        imagesPreview(this, '.image-container-form');
    });
});

$('.file-button').on('click', function () {
    $('.file-field').trigger('click');
});

$('.file-field').on('change', function () {
    var fileName = $(this)[0].files[0].name;
    $('#file').val(fileName);
});