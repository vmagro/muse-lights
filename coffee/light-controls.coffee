lightObservables = [app.light1, app.light2, app.light3, app.light4]

onChangeFor = (pickerNum) ->
  return (container, color) ->
    data = {}
    data[pickerNum] = parseInt(color.tiny.toHex(), 16)
    io().emit('light', data)
    if($('#lights-linked').prop('checked'))
      for obs in lightObservables
        obs(parseInt(color.tiny.toHex(), 16))

subscribeFor = (pickerNum) ->
  return (value) ->
    $('#picker' + (pickerNum + 1)).trigger('colorpickersliders.updateColor', '#' + value.toString(16))

light1.subscribe(subscribeFor(0))
light2.subscribe(subscribeFor(1))
light3.subscribe(subscribeFor(2))
light4.subscribe(subscribeFor(3))

io().on('light', (data) ->
  for num, color in data
    lightObservables[num] = color
)

(->
  $(".controls-li").addClass "active"
  $("#picker1").ColorPickerSliders
    color: "#000099"
    flat: true
    sliders: false
    swatches: false
    hsvpanel: true
    onchange: onChangeFor(0)

  $("#picker2").ColorPickerSliders
    color: "#000099"
    flat: true
    sliders: false
    swatches: false
    hsvpanel: true
    onchange: onChangeFor(1)

  $("#picker3").ColorPickerSliders
    color: "#000099"
    flat: true
    sliders: false
    swatches: false
    hsvpanel: true
    onchange: onChangeFor(2)

  $("#picker4").ColorPickerSliders
    color: "#000099"
    flat: true
    sliders: false
    swatches: false
    hsvpanel: true
    onchange: onChangeFor(3))()