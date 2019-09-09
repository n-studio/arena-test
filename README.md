# README

## Setup

* `echo '573438d197bb839f69decf12fd8d55f3' > config/master.key`
* `bundle && yarn`
* `RAILS_ENV=production bin/rails db:create; RAILS_ENV=production bin/rails db:migrate; RAILS_ENV=production bin/rails db:seed`
* `RAILS_ENV=production bin/rails assets:precompile`

## Run

* `RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true bin/rails server`
* Open http://localhost:3000

## Test suite

* `bin/rails test`
* `bin/rails test:system`
* `bundle exec rubocop`

# Specs

## 1. Home

* [x] Arena shows: "Waiting for fighters!..."

### Tests

* N/A

## 2. Character build

* [x] ADMIN interface
  + Characters (INDEX/NEW/EDIT/DELETE)
    - Name
    - LP
    - AP
    - LP + AP <= MAX
* [x] Seed 6 characters

### Tests

* System tests on admin/characters

## 3. Fight

* [x] Click on one character, its avatar is selected and appears on the left side of the arena
* [x] Click on a second character, its avatar is selected and appears on the right side of the arena
* [x] A button shows "START" instead of "Waiting for fighters!..." label
* [x] Click on "START", I go to a new page.
* [x] It's a Janken fight. (/fights/123/steps/1)
  - A win: B loses A's AP from his LP
  - Draw: B loses A's AP from his LP, A loses B's AP from his LP
  - Use EMOJI ✊✋✌️
  - Click next to go the next step
* [x] Show winner
* [x] Add last 10 fights results at the bottom of the page (/)
* [x] Add victory count next to character
* [ ] Click on character in Arena to cancel it

### Tests

* Unit test on Fight
* System tests on /

## 4. Weapon

* [ ] Click on first character, go to a new page (/fighters/123/weapons)
* [ ] Select Weapon, go back to Arena
* [ ] Weapons add LP/AP bonuses

### Tests

* System tests on /

# Comments

In order to keep the development under 2 hours

* no Javascript will be used.
* no File upload
