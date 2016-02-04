# Escape special characters to ASCII based on unicode.

This is an atom plugin to escape special characters.

Languages where we have a lot of special characters like portuguese, increases the numbers of Non-ASCII characters in the repository, which can be a problem when we work in different work stations, due character codification, so  this plugin helps keeping the repository without Non-ASCII characters, minimizing this problem.

Example:

 - ã --> \u00e3
 - ç --> \u00e7
 - é --> \u00e9

How to use:
  - Select the text you want to convert and press Ctrl-Alt-E

Also you can unescape characters like:

- \u00e3 --> ã
- \u00e7 --> ç
- \u00e9 --> é

How to use:
  - Select the text you want to unescape and press Ctrl-Alt-W

![Conversion](http://i3.kym-cdn.com/photos/images/original/000/058/092/wololooooooooooooooooooooo20110724-22047-dccquj.gif)
