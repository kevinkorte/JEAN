module.exports = (robot) ->
  robot.hear taylor_regex, (msg) ->
    msg.send msg.random taylor_images

taylor_images = require 'taylor.json'

taylor_img = [
    "http://i.imgur.com/LjaiTjIb.jpg",
    "http://i.imgur.com/kG0deA5b.jpg",
    "http://i.imgur.com/oz5rd9vb.jpg",
    "http://i.imgur.com/y7CWcFxb.jpg",
    "http://i.imgur.com/OFMjRXLb.jpg",
    "http://i.imgur.com/LIUbcucb.jpg",
    "http://i.imgur.com/GmD8ulZb.jpg",
    "http://i.imgur.com/WHDNPJUb.jpg",
    "http://i.imgur.com/SBeA1JRb.jpg",
    "http://i.imgur.com/2TIlzI3b.jpg",
    "http://i.imgur.com/uopDy7Ob.jpg"
]

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