web_automation
Software Automation Testing using ruby and cucumber

How to Setup (Mac)
Install Iterm

Install Xcode

Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
Install RVM
curl -L get.rvm.io | bash -s stable
source ~/.bash_profile
Install Ruby 2.6.3
rvm install 2.6.3
Install CMake
  brew install cmake pkg-config && sudo ln -s /usr/local/bin/make /usr/local/bin/gmake
Setup Gem
  rvm use 2.6.3@web-test --create
  gem install bundler
  bundle install
Run the Test
  cucumber TARGET=dev BROWSER=firefox PRIVATE=no HEADLESS=no --tags @test
  OR
  cucumber TARGET=dev BROWSER=firefox PRIVATE=no HEADLESS=no --tags @test --retry 3 --no-strict-flaky -f rerun --out rerun.txt
