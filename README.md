# README

## Setup

* `echo '573438d197bb839f69decf12fd8d55f3' > config/master.key`
* Configure `config/database.yml`
* `RAILS_ENV=production bin/rails db:create; RAILS_ENV=production bin/rails db:migrate; RAILS_ENV=production bin/rails db:seed`
* `RAILS_ENV=production bin/rails assets:precompile`

## Run

* `RAILS_ENV=production bin/rails server`
* Open http://localhost:3000

# Specs

## 1. Home

* [x] Arena shows: "Waiting for fighters!..."

### Tests

* N/A

## 2. Character build

* [ ] ADMIN interface
  + Characters (INDEX/NEW/EDIT/DELETE)
    - Name
    - LP
    - AP
    - LP + AP <= MAX
* [ ] Seed 6 characters

### Tests

* System tests on admin/characters

## 3. Fight

* [ ] Click on one character, its avatar is selected and appears on the left side of the arena
* [ ] Click on a second character, its avatar is selected and appears on the right side of the arena
* [ ] A button shows "START" instead of "Waiting for fighters!..." label
* [ ] Click on "START", I go to a new page.
* [ ] It's a Janken fight. (/fights/123/steps/1)
  - A win: B loses A's AP from his LP
  - Draw: B loses A's AP from his LP, A loses B's AP from his LP
  - Use EMOJI ✊✋✌️
  - Use jQueryUI for DOM animations
  - Click next to go the next step
* [ ] Show winner (/fights/123/results)
* [ ] Add last 10 fights results at the bottom of the page (/)
* [ ] Add victory count next to character
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

* no Javascript (except basic jQueryUI) will be used.
* no File upload
