config.load_autoconfig(False)

c.completion.shrink = True

c.editor.command = ["alacritty", "-e", "nvim", "+call cursor ({line}, {column})", "{file}"]

c.content.pdfjs = True
c.content.dns_prefetch = False
c.content.blocking.method = 'both'
c.content.autoplay = False
c.content.geolocation = False
c.content.default_encoding = 'utf-8'

c.scrolling.bar = 'always'

config.bind(',au', 'adblock-update')
config.bind(',dj', ":set content.javascript.enabled false")
# example: config.bind(',hw', "jseval alert('Hello World')")
#config.bind(',ym', 'yank inline [{title}]({url:pretty})')
