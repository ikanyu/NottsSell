# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  new PhotoCropper()

class PhotoCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update
  
  update: (coords) =>
    $('#photo_crop_x').val(coords.x)
    $('#photo_crop_y').val(coords.y)
    $('#photo_crop_w').val(coords.w)
    $('#photo_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
          $('#preview').css
                  width: Math.round(200/coords.w * $('#cropbox').width()) + 'px'
                  height: Math.round(200/coords.h * $('#cropbox').height()) + 'px'
                  marginLeft: '-' + Math.round(200/coords.w * coords.x) + 'px'
                  marginTop: '-' + Math.round(200/coords.h * coords.y) + 'px'
