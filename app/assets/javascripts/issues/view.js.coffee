jQuery ->
  $("a.add_comment_js").bind 'click', ->
    $("a.add_comment_js").addClass("hide")
    $("form.add_comment").slideDown(600)