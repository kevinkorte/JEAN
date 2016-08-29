module.exports = (robot) ->
  robot.hear taylor_regex, (msg) ->
    msg.send msg.random taylor_images

taylor_images = require 'taylor.json'

taylor_img = require '/app/scripts/taylor.json'

taylor = [
  'i (love|like) swift',
  'taylor swift',
  '(writing|coding) swift',
  'swift project',
  '(to|only) swift',
  'into swift',
  'swift channel'
]

taylor_regex = new RegExp taylor.join('|'), 'ig'