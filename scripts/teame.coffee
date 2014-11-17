# Description:
#   Based on beerme.coffee. Just gets tea images instead
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot tea me - Make me some tea
#
# Author:
#  CuriousCurmudgeon

teas = [
  "http://upload.wikimedia.org/wikipedia/commons/0/04/Tea_in_different_grade_of_fermentation.jpg",
  "http://az-teas.com/wp-content/uploads/2014/05/tea-cup1.jpg",
  "http://media.zenfs.com/en-US/video/video.pd2upload.com/video.ppcnbc.com@6a124e6d-7c09-3e61-9c50-82354cb58dc6_FULL.jpg",
  "http://www.budgetepicurean.com/wp-content/uploads/2014/08/natural-remedies-for-acne-green-tea.jpg",
  "http://lilywell.com/wp-content/uploads/2014/06/5-teas.jpg",
  "http://greenteafatburnerpills.net/wp-content/uploads/2014/01/pictureofgreentea.jpg",
  "http://cdn.sciencefocus.com/sites/default/files/imagecache/490px_wide/qanda/images/qanda_greentea.jpg",
  "http://www.gearup4success-today.com/wp-content/uploads/2012/04/green-tea-weight-loss.jpg",
  "http://overtheteacups.com/wp-content/uploads/2011/06/Green_Tea.jpg",
  "http://nehandaradio.com/wp-content/uploads/2014/05/hot-cup-tea.jpg",
]

module.exports = (robot) ->
  robot.hear /.*(tea me).*/i, (msg) ->
    msg.send msg.random teas