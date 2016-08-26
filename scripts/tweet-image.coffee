module.exports = (robot) ->
    robot.respond /(test image|img)( me)? (.+)/i, (msg) ->
        msg.send msg