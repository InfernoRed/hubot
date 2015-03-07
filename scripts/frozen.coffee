# Description:
#   Because the world needs more Frozen content
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   amazing - Shows "This is amazing" gif.
#
# Author:
#  CuriousCurmudgeon

module.exports = (robot) ->
  robot.hear /amazing\b/, (msg) ->
    msg.send 'http://i.imgur.com/shuzXHr.gif'