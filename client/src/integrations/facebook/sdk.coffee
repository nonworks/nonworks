root = document.createElement 'div'
root.id = 'fb-root'
document.body.insertBefore(root, document.body.firstChild)

fjs = document.getElementsByTagName('head')[0]
js = document.createElement('script')
js.id = 'facebook-jssdk'
js.src = "//connect.facebook.net/sv_SE/sdk.js#xfbml=1&version=v2.5"
fjs.appendChild js
