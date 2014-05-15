require 'spec_helper'

feature 'As a user, I want to' do

  scenario 'see a page to drive robots' do
    visit '/'
    expect(page).to have_content 'Martian Robots'
  end

  scenario 'direct a robot to go in a circle' do
    visit '/'
    select('Mars (5 by 3)', from: 'planet-size')
    select('(1, 1)', from: 'robot-location')
    select('East', from: 'robot-orientation')
    select('RFRFRFRF', from: 'drive-robot')
    click_button("Begin!")
    expect(page).to have_content 'Roaming Mars from (1, 1) facing East'
  end

  scenario 'direct a robot to fall off the edge' do
    pending 'Let\'s get the guts of this working'
    visit '/'
    select('Mars (5 by 3)', from: 'planet-size')
    select('(3, 2)', from: 'robot-location')
    select('North', from: 'robot-orientation')
    select('FRRFLLFFRRFLL', from: 'drive-robot')
    click_button("Begin!")
    expect(page).to have_content 'Roaming Mars from (3, 2) facing North'
    expect(page).to have_content 'Lost!'
  end

end
