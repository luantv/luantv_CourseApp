/**
 * This script to use validate jquery library to validate  details of Organisation when add or edit/amend
 */
$(document).ready(
    function() {
        $("form").validate({
            rules: {
                orgName: {
                    minlength: 5,
                    maxlength: 100,
                    required: true
                },
                orgShortDescription: {
                    minlength: 10,
                    maxlength: 120,
                    required: true
                },
                addressLine1: {
                    required: true
                },
                inputBusiness: {
                    required: true
                },
                inputPostCode: {
                    required: true
                },
                inputPhone: {
                    minlength: 10,
                    maxlength: 11,
                    required: true,
                    number: true
                },
                inputWebAddress: {
                    minlength: 10,
                    url: true
                },
                inputCountry: {
                	number: true
                },

            },
            highlight: function(element) {
                $(element).closest('.form-group')
                    .removeClass('has-success')
                    .addClass('has-error');
            },
            unhighlight: function(element) {
                $(element).closest('.form-group')
                    .removeClass('has-error').addClass(
                        'has-success');
            }
        });
    });