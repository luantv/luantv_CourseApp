/**
 * This script to create modal popup for lookup function, when fill these field referrent
 */
$(document).ready(
    function() {
        var $dialogAddress = $('#modaladdress')
            .dialog({
                modal: true,
                "height": 570,
                "width": "auto",
                autoOpen: false,
                dialogClass: "myDialog",
                hide: "explode",
                title: 'Lookup Address',
                buttons: {
                    "Dismiss": function() {
                        $dialogAddress.dialog("close");
                    },
                    "Select": function() {
                        var ID = document
                            .getElementById('addressIDval').value;
                        var postcode = document
                            .getElementsByName(ID)[0]
                            .getElementsByTagName('td')[1].childNodes[
                                0].nodeValue;
                        var countyName = document
                            .getElementsByName(ID)[0]
                            .getElementsByTagName('td')[3].childNodes[
                                0].nodeValue;
                        var townName = document
                            .getElementsByName(ID)[0]
                            .getElementsByTagName('td')[2].childNodes[
                                0].nodeValue;
                        var countryName = document
                            .getElementsByName(ID)[0]
                            .getElementsByTagName('td')[4].childNodes[
                                0].nodeValue;
                        $('#inputPostCode').val(
                            postcode);
                        $('#inputTown').val(townName);
                        $('#inputCounty').val(
                            countyName);
                        $('#inputCountry').val(
                            countryName);
                        $('#inputaddressID').val(
                            ID.split('-')[1]);
                        $dialogAddress.dialog("close");
                    }
                },
                close: function() {
                    $dialogAddress.dialog("close");
                }
            });
        var $dialogContact = $('#modalcontact')
            .dialog({
                modal: true,
                "height": 570,
                "width": "auto",
                autoOpen: false,
                dialogClass: "myDialog",
                hide: "explode",
                title: 'Lookup Contact',
                buttons: {
                    "Dismiss": function() {
                        $dialogContact.dialog("close");
                    },
                    "Select": function() {
                        var ID = document
                            .getElementById('contactID').value;
                        var firstName = document
                            .getElementsByName(ID)[0]
                            .getElementsByTagName('td')[0].childNodes[
                                0].nodeValue;
                        $('#inputContactName').val(
                            firstName);
                        $('#inputcontactID').val(
                            ID.split('-')[1]);
                        $dialogContact.dialog("close");
                    }
                },
                close: function() {
                    $dialogContact.dialog("close");
                }
            });
        var $dialogSIC = $('#modalsic')
            .dialog({
                modal: true,
                "height": 570,
                "width": "auto",
                autoOpen: false,
                dialogClass: "myDialog",
                hide: "explode",
                title: 'Lookup SIC',
                buttons: {
                    "Dismiss": function() {
                        $dialogSIC.dialog("close");
                    },
                    "Select": function() {
                        var ID = document
                            .getElementById('sicCode').value;
                        var business = document
                            .getElementsByName(ID)[0]
                            .getElementsByTagName('td')[0].childNodes[
                                0].nodeValue;
                        var sicCode = document
                            .getElementsByName(ID)[0]
                            .getElementsByTagName('td')[1].childNodes[
                                0].nodeValue;
                        $('#inputBusiness').val(
                            business);
                        $('#inputSICCode').val(sicCode);
                        $dialogSIC.dialog("close");
                    }
                },
                close: function() {
                    $dialogSIC.dialog("close");
                }
            });
        $("#lookupadress").click(function() {
            $dialogAddress.load('lookupAddress', function() {
                $dialogAddress.dialog('open');
            });
        });
        $("#lookupcontact").click(function() {

            $dialogContact.load('lookupContact', function() {
                $dialogContact.dialog("open");
            });
        });
        $("#lookupsic").click(function() {

            $dialogSIC.load('lookupSIC', function() {
                $dialogSIC.dialog("open");
            });
        });
    });