// Load the Visualization API and the piechart package.
google.load('visualization', '1.0', {'packages':['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
google.setOnLoadCallback(init);


// Callback that creates and populates a data table, 
// instantiates the pie chart, passes in the data and
// draws it.
function init() {
  $('button#plot').click(function() {

    var start_at = $('#start_at').val();
    var finish_at = $('#finish_at').val();
    var dt = $('#dt').val();

    var chart_data = [];

    var uri = '/data/' + start_at + '/' + finish_at + '/' + dt;

    $.getJSON(uri, function( data ) {

      $.each( data, function( key, val ) {
        chart_data.push([parseInt(key),parseInt(val['true']),parseInt(val['false'])]);
      });

      // Create the data table.
      var data = google.visualization.arrayToDataTable(
        [["Time", "Delivered", "Failed"]].concat(chart_data)
      );

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
          { calc: "stringify",
            sourceColumn: 1,
            type: "string",
            role: "annotation" },
          2]);

      // Set chart options
      var options = {
        width: 600,
        height: 400,
        legend: { position: 'top', maxLines: 3 },
        bar: { groupWidth: '75%' },
        isStacked: true,
      };

      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
      chart.draw(view, options);
    });
  });
};


