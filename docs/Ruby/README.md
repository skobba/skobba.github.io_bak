# Ruby
## Install
:warning: Every time you update Ruby to a version in which the first two digits change, update your path to match.

1. For Mac - Install commandline tools and set SDKROOT
```
xcode-select --install
export SDKROOT=$(xcrun --show-sdk-path)
```

2. Install latest version of ruby with homebrew:
```
brew install ruby
```

3. Update PATH
```
echo 'export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"' >> ~/.zshrc
```

4. Check ruby and gem paths
```
which ruby
gem env
```

## Gem
### List installed gems
```
gem list
```

### Remove all installed gems
```bash
for x in `gem list --no-versions`; do gem uninstall $x -a -x -I; done
```

## Jekyll
1. For compilers to find ruby you may need to set:
```
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
```

2. Install Jekyll for Ruby
Use the first for system install
```
gem install bundler jekyll

gem install --user-install bundler jekyll
```

3. Install gems from Gemfile
```
bundle install
```
