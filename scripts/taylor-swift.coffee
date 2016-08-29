module.exports = (robot) ->
  robot.hear taylor_regex, (msg) ->
    msg.send msg.random taylor_img

taylor_img = require './taylor.json'

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