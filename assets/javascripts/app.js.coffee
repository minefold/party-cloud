#= require raphael
#= require_self

rand = (n) ->
  Math.floor(Math.random() * n)

$(document).ready ->
  paper = Raphael($('#paper')[0])

  # Red, Green, Blue, Yellow, Gray
  colors = ['#F34', '#5C2', '#06C', '#FD0', '#333', '#CCC']

  shapeLimit = 200

  makeYouRandy = (shape) ->
    shape.translate(
      -shapeLimit + rand(paper.width + shapeLimit),
      -shapeLimit + rand(paper.height + shapeLimit)
    )

    scale = Math.random()
    shape.scale(scale, scale)
    shape.rotate(rand(360))

    shape.attr(
      stroke: colors[rand(colors.length)]
      'stroke-width': 5+rand(10)
    )

  # Shapes

  circle = ->
    paper.circle(50, 50, 50)

  rect = ->
    paper.rect(0, 0, 50+rand(50), 100+rand(100))

  zigzag = ->
    paper.path("M0,0 L100,100 L0,200 L100,300 L0,400")

  triangle = ->
    paper.path("M0,0 L100,100 L0,200 Z")

  shapes = [circle, rect, zigzag, triangle]

  for i in [0..(10 + rand((paper.width * paper.height) / 20000))]
    shape = shapes[rand(shapes.length)]()
    makeYouRandy(shape)
