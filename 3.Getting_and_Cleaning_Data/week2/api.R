
# library(httr)

# myapp = oauth_app("twitter", key = "oX2cAiTPLeiGOC2qgbeGf1SgU", secret = "ztQLiq0KHydLw2N9e30wdq6zerWdlOtGcZJwI40uVtU983gwiv")

# sig = sign_oauth1.0(myapp, token = "oX2cAiTPLeiGOC2qgbeGf1SgU", token_secret = "ztQLiq0KHydLw2N9e30wdq6zerWdlOtGcZJwI40uVtU983gwiv")

# homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)


# print(homeTL)


library(httr)
library(rjson)
library(jsonlite)
# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
  key = "c62014f03d7b4f5d44a9",
  secret = "fff7a5ab87e60d4b998e3afbdf7e3abaf7e6b25d")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
jsonData = content(req)

jsonRefineData = jsonlite::fromJSON(toJSON(jsonData))

# print(head(jsonRefineData))


datas <- (jsonRefineData[jsonRefineData$name == 'datasharing', ])


print(datas$created_at)





