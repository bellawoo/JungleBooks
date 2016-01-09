# README

A simple application that allows book club members to suggest and vote on books.

## Nifty Integrations
The application utilizes Amazon ItemSearch API to provide members with information on books. If you are visiting this on production, you may notice that the Amazon results are erroring. This is becuase to use the Amazon Product Marketing API, I have to be registered as an Amazon affiliate. However, since I'm not monetizing anything, Amazon likes to close out my affiliate account after a while because I'm not making them any money.

Goodreads integration currently under construction. Once completed, members can add the winning book to their Goodreads shelf.

For details on gems, libraries and the like, you should probably just look at my gemfile.

## How It Works
This app has been built using my own book club's rules and operations as the guidelines. If you decided to fork this and use it for yourself, you may find that it makes no sense for how you run your own club.

### My club's rules
1. Every month there is one host. That host suggests a few books. There is no limit to how many books the host can suggest.
2. Members vote on the suggested books.
3. After every member has voted or a certain time period has elapsed, whichever comes first, voting is closed.
4. A new host is determined for the following month.
5. Happy reading!