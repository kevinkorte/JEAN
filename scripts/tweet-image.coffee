module.exports = (robot) ->

  robot.respond /(kevin)( me)? (.+)/i, (msg) ->
      imageMe msg, msg.match[3], (url) ->
          msg.send url

imageMe = (msg, query)
    googleCseId = process.env.HUBOT_GOOGLE_CSE_ID
    if googleCseId
        # Using Google Custom Search API
        googleApiKey = process.env.HUBOT_GOOGLE_CSE_KEY
        if !googleApiKey
            msg.robot.logger.error "Missing environment variable HUBOT_GOOGLE_CSE_KEY"
            msg.send "Missing server environment variable HUBOT_GOOGLE_CSE_KEY."
            return
        q =
            q: query,
            searchType:'image',
            safe: process.env.HUBOT_GOOGLE_SAFE_SEARCH || 'high',
            fields:'items(link)',
            cx: googleCseId,
            key: googleApiKey
        url = 'https://www.googleapis.com/customsearch/v1'
        msg.http(url)
            .query(q)
            .get() (err,res,body) ->
                if err
                    if res.statusCode is 403
                        msg.send "Daily image quota exceeded, using alternate source."
                    else
                        msg.send "Encountered an error :( #{err}"
                    return
                if res.statusCode isnt 200
                    msg.send "Bad HTTP response :( #{res.statusCode}"
                    return
                response = JSON.parse(body)
                if response?.items
                    image = msg.random response.items
                    ensureImageExtension(image.link)
                else
                    msg.send "Oops. I had trouble searching '#{query}'. Try later."
                    ((error) ->
                        msg.robot.logger.error error.message
                        msg.robot.logger
                            .error "(see #{error.extendedHelp})" if error.extendedHelp
                      ) error for error in response.error.errors if response.error?.errors
    else
        msg.send "Google Image Search API is no longer available. "

ensureImageExtension = (url) ->
  if /(png|jpe?g|gif)$/i.test(url)
    url
  else
    "#{url}#.png"