# Try-Blog-Theme-Jekyll.md

Posted on Jan. 21, 2024

---

Per [Jekyll official guide](https://jekyllrb.com/), I need to install Ruby and Jekyll to preview the site locally.

I wasted so much time to [install Ruby on my Macbook Pro M1](./Ruby-101.md).

It didn't go smoothly to install Jekyll.

```shell

I failed to install Jekyll on my Macbook Pro M1 per the [official guide](https://jekyllrb.com/).

```shell
➜  ~ gem install bundler jekyll
Successfully installed bundler-2.5.5
Parsing documentation for bundler-2.5.5
Done installing documentation for bundler after 0 seconds
Building native extensions. This could take a while...
ERROR:  Error installing jekyll:
	ERROR: Failed to build gem native extension.

    current directory: /Users/bytedance/.rvm/gems/ruby-3.0.0/gems/eventmachine-1.2.7/ext
/Users/bytedance/.rvm/rubies/ruby-3.0.0/bin/ruby -I /Users/bytedance/.rvm/rubies/ruby-3.0.0/lib/ruby/3.0.0 -r ./siteconf20240121-38991-b5zskd.rb extconf.rb
checking for -lcrypto... yes
checking for -lssl... yes
checking for openssl/ssl.h... yes
checking for openssl/err.h... yes
checking for rb_trap_immediate in ruby.h,rubysig.h... no
checking for rb_thread_blocking_region()... no
checking for rb_thread_call_without_gvl() in ruby/thread.h... yes
checking for rb_thread_fd_select()... yes
checking for rb_fdset_t in ruby/intern.h... yes
checking for rb_wait_for_single_fd()... yes
checking for rb_enable_interrupt()... no
checking for rb_time_new()... yes
checking for inotify_init() in sys/inotify.h... no
checking for __NR_inotify_init in sys/syscall.h... no
checking for writev() in sys/uio.h... yes
checking for pipe2() in unistd.h... no
checking for accept4() in sys/socket.h... no
checking for SOCK_CLOEXEC in sys/socket.h... no
checking for sys/event.h... yes
checking for sys/queue.h... yes
checking for clock_gettime()... yes
checking for CLOCK_MONOTONIC_RAW in time.h... yes
checking for CLOCK_MONOTONIC in time.h... yes
CXXFLAGS= -Wall -Wextra -Wno-deprecated-declarations -Wno-ignored-qualifiers -Wno-unused-result -Wno-address
creating Makefile

current directory: /Users/bytedance/.rvm/gems/ruby-3.0.0/gems/eventmachine-1.2.7/ext
make "DESTDIR=" clean

current directory: /Users/bytedance/.rvm/gems/ruby-3.0.0/gems/eventmachine-1.2.7/ext
make "DESTDIR="
compiling binder.cpp
In file included from binder.cpp:20:
./project.h:119:10: fatal error: 'openssl/ssl.h' file not found
#include <openssl/ssl.h>
         ^~~~~~~~~~~~~~~
1 error generated.
make: *** [binder.o] Error 1

make failed, exit code 2

Gem files will remain installed in /Users/bytedance/.rvm/gems/ruby-3.0.0/gems/eventmachine-1.2.7 for inspection.
Results logged to /Users/bytedance/.rvm/gems/ruby-3.0.0/extensions/arm64-darwin-23/3.0.0/eventmachine-1.2.7/gem_make.out
1 gem installed
```

Found a solution from the [official site](https://talk.jekyllrb.com/t/jekyll-install-fatal-error-openssl-ssl-h-file-not-found-macos/7660).

```shell
➜  ~ brew link --force openssl
Warning: Already linked: /opt/homebrew/Cellar/openssl@3/3.1.2
To relink, run:
  brew unlink openssl@3 && brew link openssl@3
➜  ~ rvm use 3.0.0
Using /Users/bytedance/.rvm/gems/ruby-3.0.0
➜  ~ gem install bundler jekyll
Successfully installed bundler-2.5.5
Parsing documentation for bundler-2.5.5
Done installing documentation for bundler after 0 seconds
Building native extensions. This could take a while...
Successfully installed eventmachine-1.2.7
Successfully installed em-websocket-0.5.3
Successfully installed colorator-1.1.0
Successfully installed public_suffix-5.0.4
Successfully installed addressable-2.8.6
Successfully installed jekyll-4.3.3
Parsing documentation for eventmachine-1.2.7
Installing ri documentation for eventmachine-1.2.7
Parsing documentation for em-websocket-0.5.3
Installing ri documentation for em-websocket-0.5.3
Parsing documentation for colorator-1.1.0
Installing ri documentation for colorator-1.1.0
Parsing documentation for public_suffix-5.0.4
Installing ri documentation for public_suffix-5.0.4
Parsing documentation for addressable-2.8.6
Installing ri documentation for addressable-2.8.6
Parsing documentation for jekyll-4.3.3
Installing ri documentation for jekyll-4.3.3
Done installing documentation for eventmachine, em-websocket, colorator, public_suffix, addressable, jekyll after 3 seconds
7 gems installed
```

Use the following to preview the site.

```shell
➜  blog git:(main) ✗ rvm use 3.0.0
Using /Users/bytedance/.rvm/gems/ruby-3.0.0
➜  blog git:(main) bundle exec jekyll serve -w
Configuration file: /Users/bytedance/Programming/golang/src/zzxwill/blog/_config.yml
            Source: /Users/bytedance/Programming/golang/src/zzxwill/blog
       Destination: /Users/bytedance/Programming/golang/src/zzxwill/blog/_site
 Incremental build: disabled. Enable with --incremental
      Generating...
       Jekyll Feed: Generating feed for posts

Run in verbose mode to see all warnings.
                    done in 0.693 seconds.
 Auto-regeneration: enabled for '/Users/bytedance/Programming/golang/src/zzxwill/blog'
    Server address: http://127.0.0.1:4000/
  Server running... press ctrl-c to stop.
```
