# Description:
#   Responds to asciify
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   asciify "The Moon is Rising"
#
# Author:
#  rjhernandez

ascii = require 'asciify'

module.exports = (robot) ->
  robot.hear /asciify (.*)/i, (msg) ->
      ascii msg.match[1], (err, rsp) -> msg.send '```\n' + rsp + '\n```'
