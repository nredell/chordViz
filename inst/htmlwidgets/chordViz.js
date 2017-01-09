HTMLWidgets.widget({

    name: 'chordViz',
    type: 'output',

    initialize: function(el, width, height) {
        return d3.chord();
    },

    renderValue: function(el, params, chord) {

        var elementId = el.id;
        chord.params = params;
        var matrix = params.matrix;
        var options = params.options;
        var width = el.offsetWidth;
        var height = el.offsetHeight;
        var start = options.start;
        groupColors = options.groupColors,
        groupNames = options.groupNames;

        var outerRadius = Math.min(width, height) * 0.5 - 40,
        innerRadius = outerRadius - 30;

        var data = [];

        matrix.forEach(function(r,i){ r.forEach(function(c,j){ data.push([i,j,c])})});

        var ch = viz.ch().data(data)
        .padding(0.05)
        .labelPadding(0.10)
        .innerRadius(innerRadius)
        .outerRadius(outerRadius)
        .label(function(d,i){ return groupNames[i] + " (" + d.value + ")";})
        .startAngle(Math.PI * start)
        .fill(function(d){ return groupColors[d];});

        var svg = d3.select("#" + elementId)
        .append("svg")
        .attr("height", height)
        .attr("width", width);

        var svgFinal = svg.append("g")
        .attr("transform", "translate("+ width / 2 + "," + height / 2 + ")")
        .call(ch);

        svgFinal;
    }
});

