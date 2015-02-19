# Description:
#   Finds DYK or "Did you know".
#
# Commands:

module.exports = (robot) ->
  robot.hear /(DYK)|(Did you know)|(The more you know)/ig, (msg) ->
    msg.send 'http://vignette1.wikia.nocookie.net/uncyclopedia/images/7/7c/Themoreyouknow.jpg/revision/latest?cb=20081023004830'
