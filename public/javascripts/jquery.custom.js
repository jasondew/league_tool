jQuery.fn.availability_picker = function() {
  var form = $("#availability_form");

  form.submit(function() {
    var table = jQuery(this);
    var hidden_field = $('<input type="hidden" name="availabilities"/>');
    var time_ids = new Array;

    table.find("td").each(function() {
      var td = jQuery(this);

      if (td.hasClass("highlight")) {
        time_ids.push(td.attr('time_id'));
      }
    });

    hidden_field.attr('value', time_ids.join("|"));
    form.append(hidden_field);
  });

  jQuery(this).each(function() {
    var table = jQuery(this);

    table.find("td").each(function() {
      var td = jQuery(this);

      td.click(function() {
        var me = jQuery(this);

        if (me.hasClass("highlight")) {
          me.removeClass("highlight");
        }
        else {
          me.addClass("highlight");
        }
      });
    });
  });

};
