config.load_autoconfig(False)

c.colors.webpage.preferred_color_scheme = 'dark'

c.completion.shrink = True
c.completion.web_history.max_items = 6
c.completion.open_categories = ["quickmarks", "bookmarks", "history"] 

c.confirm_quit = ["downloads"]
c.editor.command = ["$TERMINAL", "-e", "nvim", "+call cursor ({line}, {column})", "{file}"]

c.content.pdfjs = True
c.content.dns_prefetch = False
#c.content.blocking.method = 'both'
c.content.autoplay = False
c.content.geolocation = False
c.content.default_encoding = 'utf-8'

c.scrolling.bar = 'always'
c.tabs.show = 'multiple'

## url
c.url.default_page = "qute://start"
c.url.searchengines = {
  "DEFAULT": "https://duckduckgo.com?q={}",
  "!aw":     "https://wiki.archlinux.org/?search={}",
  "!ddg":    "https://duckduckgo.com?q={}",
  "!dl":     "https://deepl.com/translator#_/en/{}",
  "!diki":   "https://www.diki.pl/slownik-angielskiego?q={}",  
  "!g" :     "https://www.google.com/search?q={}",
  "!gh":     "https://github.com/search?q={}",
  "!h":      "https://hoogle.haskell.org/?hoogle={}",
  "!lb":     "https://letterboxd.com/search/{}",
  "!r":      "https://www.reddit.com/search?q={}",
  "!yt":     "https://www.youtube.com/results?search_query={}",
  "!w":      "https://wikipedia.org/w/index.php?search={}",
}

## binds
config.bind('<Ctrl-n>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-p>', 'completion-item-focus prev', mode='command')

config.bind(';iy', 'hint images yank')
config.bind(';iY', 'hint images yank-primary')
config.bind(';iO', 'hint images run open -t {hint-url}')

config.bind(',au', 'adblock-update')
config.bind(',dj', ":set content.javascript.enabled false")
#config.bind(',ym', 'yank inline [{title}]({url:pretty})')

