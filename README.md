# web_automation
Software Automation Testing using ruby and cucumber

## How to Setup (Mac)

1. Install [Iterm](https://iterm2.com/downloads.html)


2. Install [Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12)


3. Install [Homebrew](https://brew.sh/)

  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

4. Install [RVM](https://rvm.io/)

  ```
  curl -L get.rvm.io | bash -s stable
  source ~/.bash_profile
  ```

5. Install Ruby 2.6.3

  ```
  rvm install 2.6.3
  ```

6. Install CMake

  ```
    brew install cmake pkg-config && sudo ln -s /usr/local/bin/make /usr/local/bin/gmake
  ```

11. Setup Gem

  ```
    rvm use 2.6.3@web-test --create
    gem install bundler
    bundle install
  ```

12. Run the Test

  ```
    cucumber TARGET=dev BROWSER=firefox PRIVATE=no HEADLESS=no --tags @test
    OR
    cucumber TARGET=dev BROWSER=firefox PRIVATE=no HEADLESS=no --tags @test --retry 3 --no-strict-flaky -f rerun --out rerun.txt
  ```
