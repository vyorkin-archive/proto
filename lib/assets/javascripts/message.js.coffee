MapEditor.value '$toastr', window.toastr

MapEditor.service 'msg', ->
  class Msg
    error:   (msg) -> $toastr.error(msg)
    success: (msg) -> $toastr.success(msg)
    info:    (msg) -> $toastr.info(msg)
