config.load_autoconfig(False)

c.completion.shrink = True
c.completion.web_history.max_items = 6
c.completion.open_categories = ["quickmarks", "bookmarks", "history"] 

c.confirm_quit = ["downloads"]
c.editor.command = ["alacritty", "-e", "nvim", "+call cursor ({line}, {column})", "{file}"]

c.content.pdfjs = True
c.content.dns_prefetch = False
#c.content.blocking.method = 'both'
c.content.autoplay = False
c.content.geolocation = False
c.content.default_encoding = 'utf-8'

c.scrolling.bar = 'always'
c.colors.webpage.preferred_color_scheme = 'dark'
c.tabs.show = 'multiple'

## binds
config.bind('<Ctrl-j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-k>', 'completion-item-focus prev', mode='command')
config.unbind('<Ctrl+h>') #homepage key

config.bind(';iy', 'hint images yank')
config.bind(';iY', 'hint images yank-primary')
config.bind(';iO', 'hint images run open -t {hint-url}')


config.bind(',au', 'adblock-update')
config.bind(',dj', ":set content.javascript.enabled false")
# example: config.bind(',hw', "jseval alert('Hello World')")
#config.bind(',ym', 'yank inline [{title}]({url:pretty})')

## url
c.url.default_page = "qute://start"

c.url.searchengines = {
  "DEFAULT": "https://duckduckgo.com?q={}",
  "aw":      "https://wiki.archlinux.org/?search={}",
  "wp":      "https://wikipedia.org/w/index.php?search={}",
  "lb":      "https://letterboxd.com/search/{}",
  "g" :      "https://www.google.com/search?q={}",
  "ddg":     "https://duckduckgo.com?q={}",
  "sp":      "https://startpage.com/sp/search?query={}",
  "dl":      "https://deepl.com/translator#_/en/{}",
  "diki":    "https://www.diki.pl/slownik-angielskiego?q={}",  
  "gh":      "https://github.com/search?q={}",
  "ho":      "https://hoogle.haskell.org/?hoogle={}",
  "yt":      "https://www.youtube.com/results?search_query={}"
}
