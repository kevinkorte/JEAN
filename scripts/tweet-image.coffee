module.exports = (robot) ->

  robot.respond /(kevin)( me)? (.+)/i, (msg) ->
     msg.send msg.match[3]