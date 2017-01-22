function battle_update(item, x_offset=0, y_offset=0) {
  return item
           .attr('x', function(d) { return d.x - x_offset; })
           .attr('y', function(d) { return d.y - y_offset; });
}

function battle_enter(item, label, image, x_offset=0, y_offset=0) {
  return item.enter()
           .append('svg:image')
           .classed(label, true)
           .attr('xlink:href', image)
           .attr('x', function(d) { return d.x - x_offset; })
           .attr('y', function(d) { return d.y - y_offset; });
}

function battle(matchData) {
  line = matchData.shift();

  svgContainer = d3.select('svg');

  bodies = svgContainer.selectAll('image.body').data(line['bots']);
  turrets = svgContainer.selectAll('image.turret').data(line['bots']);
  radars = svgContainer.selectAll('image.radar').data(line['bots']);
  shells = svgContainer.selectAll('circle.shell').data(line['shells']);
  explosions = svgContainer.selectAll('image.explosion').data(line['explosions']);

  battle_update(bodies, 18, 18)
    .attr("transform", function(d) { return "rotate("+(180 - d.heading)+","+d.x+","+d.y+")" });
  battle_update(turrets, 10, 30)
    .attr("transform", function(d) { return "rotate("+(180 - d.turret)+","+d.x+","+d.y+")" });
  battle_update(radars, 11, 8)
    .attr("transform", function(d) { return "rotate("+(180 - d.radar)+","+d.x+","+d.y+")" });

  shells
    .attr('cx', function(d) { return d.x; })
    .attr('cy', function(d) { return d.y; });

  explosions
    .attr('xlink:href', function(d) { return '../images/explosions/explosion2-'+d.explosion+'.png';});


  battle_enter(bodies, 'body', '../images/body.png', 18, 18);
  battle_enter(bodies, 'turret', '../images/turret.png', 10, 30);
  battle_enter(bodies, 'radar', '../images/radar.png', 11, 8);

  shells.enter()
    .append('circle')
    .classed('shell', true)
    .attr("r", 2)
    .attr("fill", 'black')
    .attr('cx', function(d) { return d.x; })
    .attr('cy', function(d) { return d.y; });
  explosions.enter()
    .append('svg:image')
    .classed('explosion', true)
    .attr("x", function(d) { return d.x - 64; })
    .attr("y", function(d) { return d.y - 64; });

  bodies.exit().remove();
  turrets.exit().remove();
  radars.exit().remove();
  shells.exit().remove();
  explosions.exit().remove();

  if ( matchData.length > 0 ) {
    setTimeout(battle,5,matchData);
  }
}
