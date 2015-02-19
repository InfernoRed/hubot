# Description:
#   Responds to DYK or "Did you know" or "The more you know"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   DYK - Did you know - The more you know
#
# Author:
#  rjhernandez

module.exports = (robot) ->
  robot.hear /(DYK)|(Did you know)|(The more you know)/ig, (msg) ->
    getImage msg, (url) ->
      msg.send url

getImage = (msg, handler) ->
  q = v: '1.0', rsz: '8', q: "The more you know!", safe: 'active'
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image = msg.random images
        handler ensureImageExtension image.unescapedUrl

ensureImageExtension = (url) ->
  ext = url.split('.').pop()
  if /(png|jpe?g|gif)/i.test(ext)
    url
  else
    "#{url}#.png"
