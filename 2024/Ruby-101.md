# Ruby-101.md

Posted on Jan. 21, 2024

---

## The ways to install Ruby

On macOS machines, you can use third-party tools (rbenv and RVM).

It's pretty wired that Ruby official doesn't provide an authentic way to install Ruby, like other languages do.



## Install Ruby

I failed a few times.

```bash
➜  man1 rvm install 2.7.5

Searching for binary rubies, this might take some time.
No binary rubies available for: osx/14.0/arm64/ruby-2.7.5.
Continuing with compilation. Please read 'rvm help mount' to get more information on binary rubies.
Checking requirements for osx.
Certificates bundle '/opt/homebrew/etc/openssl@1.1/cert.pem' is already up to date.
Requirements installation successful.
Installing Ruby from source to: /Users/bytedance/.rvm/rubies/ruby-2.7.5, this may take a while depending on your cpu(s)...
ruby-2.7.5 - #downloading ruby-2.7.5, this may take a while depending on your connection...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 14.1M  100 14.1M    0     0  34.4M      0 --:--:-- --:--:-- --:--:-- 34.8M
No checksum for downloaded archive, recording checksum in user configuration.
ruby-2.7.5 - #extracting ruby-2.7.5 to /Users/bytedance/.rvm/src/ruby-2.7.5.....
ruby-2.7.5 - #configuring.........................................................................
ruby-2.7.5 - #post-configuration.
ruby-2.7.5 - #compiling........................................................................................
ruby-2.7.5 - #installing........
Error running '__rvm_make install',
please read /Users/bytedance/.rvm/log/1705817314_ruby-2.7.5/install.log
There has been an error while running make install. Halting the installation.
```

This [tip from GitHub](https://github.com/rvm/rvm/issues/5285#issuecomment-1623030117) helps me out of it.
```shell
brew uninstall --ignore-dependencies openssl@3
brew reinstall openssl@1.1
rvm install 3.0.0
```

It worked so well. And ChatGPT doesn't know the solution.

```shell
Requirements installation successful.
Installing Ruby from source to: /Users/bytedance/.rvm/rubies/ruby-3.0.0, this may take a while depending on your cpu(s)...
ruby-3.0.0 - #downloading ruby-3.0.0, this may take a while depending on your connection...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 18.6M  100 18.6M    0     0  43.7M      0 --:--:-- --:--:-- --:--:-- 44.0M
ruby-3.0.0 - #extracting ruby-3.0.0 to /Users/bytedance/.rvm/src/ruby-3.0.0.....
ruby-3.0.0 - #configuring..........................................................................
ruby-3.0.0 - #post-configuration.
ruby-3.0.0 - #compiling..................................................................................
ruby-3.0.0 - #installing...............
ruby-3.0.0 - #making binaries executable...
Installed rubygems 3.2.3 is newer than 3.0.9 provided with installed ruby, skipping installation, use --force to force installation.
ruby-3.0.0 - #gemset created /Users/bytedance/.rvm/gems/ruby-3.0.0@global
ruby-3.0.0 - #importing gemset /Users/bytedance/.rvm/gemsets/global.gems................................................................
ruby-3.0.0 - #generating global wrappers........
ruby-3.0.0 - #gemset created /Users/bytedance/.rvm/gems/ruby-3.0.0
ruby-3.0.0 - #importing gemsetfile /Users/bytedance/.rvm/gemsets/default.gems evaluated to empty gem list
ruby-3.0.0 - #generating default wrappers........
ruby-3.0.0 - #adjusting #shebangs for (gem irb erb ri rdoc testrb rake).
Install of ruby-3.0.0 - #complete
Ruby was built without documentation, to build it run: rvm docs generate-ri
```

## Change Ruby version

```shell
➜  ~ ruby -v
ruby 2.6.10p210 (2022-04-12 revision 67958) [universal.arm64e-darwin23]
➜  ~ rvm use 3.0.0
Using /Users/bytedance/.rvm/gems/ruby-3.0.0
➜  ~ ruby -v
ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [arm64-darwin23]
```