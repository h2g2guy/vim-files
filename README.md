vim-files
=========

My vim configuration, for your perusal (and my history management)

Installation
------------

I don't recommend you use my configuration out of the box.  I would recommend
you run through what you see here and pick and choose stuff you like.  If
you do want to clone and play with the repo, though, who am I to stop you?
There are just a few things you should keep in mind.

Start by cloning this repo the way you normally would:

    git clone git@github.com:h2g2guy/vim-files.git

You'll notice that you pull in my .vimrc (renamed to vimrc) and pathogen by
tpope, but you get a bunch of extra folders hanging out.  That's fine; those
folders are for the plugins I use.  I didn't want to just give you the files
for those projects without directing you towards the fine people who made them,
though, so they're submodules.  If you've never used submodules before, it's a
really confenient feature in git that allows you to essentially 'include' git
repos in other repos.  But it takes a little extra work to clone.

After cloning, step into the root directory of the files and initialize your 
submodule file:

    cd vim-files
    git submodule init

Finally, pull in the submodules.  This may result in an outdated vim plugin, 
but since I am using exactly these files as they are in this repo, it's at 
least guaranteed to work!

    git submodule update

Under some strange circumstances that I don't fully understand at the moment,
you may end up with a strange situation where it thinks you have some staged 
changes.  If this is the case, updating the submodules again should fix the 
problem.

(Anticipated) FAQs
------------------

### vim-airline looks weird!
That's probably because you haven't patched your fonts, or gone through the 
whole fontconfig thing.  Check out the FAQ for vim-airline for more 
information.

### What's with the three different Java/Clojure plugins?
Some time ago, I was very interested in a Clojure project called Overtone.
This, combined with my love of vim and refusal to switch editors just to work
in a new language, resulted in my searching for a solution to get a REPL in
vim.  I actually sort of figured out a solution to that, though it involves a
bunch of nasty moving parts and whatnot that I haven't gotten around to
explaining in full yet.  Ping me in some way if you're interested in this
solution, and I'll get on that.

Contributing
------------

Yes, I fully support suggestions and pull requests (though I have no idea why
you'd want to do the latter).  Bear in mind that I'm, for the most part, still
a vim novice, so I might avoid plugins that I don't fully understand or that
I feel would overcomplicate my experience, but all that aside, I'd love to hear
what you guys have to say about my setup!  

I will refuse pull requests that include the files of a plugin without using a
submodule.  I think credit should be given where it's due, and I think this
is a great way of doing so; also, it helps me keep ALL of my plugins up to date
with a simple git command!
