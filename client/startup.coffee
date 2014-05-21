Meteor.startup ->
  userId = Meteor.userId()
  if Meteor.settings.public.isDebug
    if (not userId and (location.host == "localhost:3000" or location.host.indexOf("192.168") != -1))
      # Never comment this code; use http://pintask:3000/ instead
      if jQuery.browser.mozilla
        Meteor.loginWithPassword("denis.gorbachev+meetings.denis@faster-than-wind.ru", "123123", share.loginCallback)
      else
        Meteor.loginWithPassword("denis.gorbachev+meetings.morten@faster-than-wind.ru", "123123", share.loginCallback)
  if share.isDebug
    amplify.store("processedPropertyIds", [])
    amplify.store("requiredPropertyIds", [])
  else
    amplify.store("processedPropertyIds", amplify.store("processedPropertyIds") or [])
    amplify.store("requiredPropertyIds", amplify.store("requiredPropertyIds") or [])

#window.fbAsyncInit = ->
#  FB.init(
#    appId: Meteor.settings.public.facebook.appId
#    xfbml: true
#  )