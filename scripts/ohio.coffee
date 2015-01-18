# Description:
#   Responds with I-O to any O-H.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   O-H - I-O
#
# Author:
#  CuriousCurmudgeon

module.exports = (robot) ->
  robot.hear /O-H\b/, (msg) ->
    msg.send 'I-O'