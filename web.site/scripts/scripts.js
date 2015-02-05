//========================= START DOCUMENT READY================================//
$(document).ready(function () {
	
	$('.scrollBox').jScrollPane({showArrows: true,arrowScrollOnHover: true});

  //========================= START MAIN NAV DROPDOWNS================================//		
    $("ul#mainnav li").bind("hover", function () {
        $(this).find("ul.subnav").slideDown(200).show();
        $(this).hover(function () {
        }, function () {
            $(this).find("ul.subnav").slideUp('fast');
        });

    }).hover(function () {
        $(this).addClass("subhover");
    }, function () {
        $(this).removeClass("subhover");
    });
    $('ul#mainnav li').has('ul.subnav').addClass("hasDropDown");

	$(".videoPlayer_Holder").each(function(i) {
        var divID = $(this).find("div").attr("id");
        var file = $(this).find("input[name='jwFile']").val();
        var thumb = $(this).find("input[name='jwThumb']").val();
        
        jwplayer(divID).setup({
          'flashplayer': '/scripts/player.swf',
          'id': 'playerID',
          'width': '240',
          'height': '170',
          'image': thumb,
           'file': file 
        });          
	});
	
	/*** DATE RANGE PICKER ***/
	$(function() {
		$( "#from" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			onClose: function( selectedDate ) {
				$( "#to" ).datepicker( "option", "minDate", selectedDate);
			}
		});
		$( "#to" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			onClose: function( selectedDate ) {
				$( "#from" ).datepicker( "option", "maxDate", selectedDate);
			}
		});
	});





});
//========================= END DOCUMENT READY================================//		
