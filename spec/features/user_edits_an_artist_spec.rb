require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "displays updated info on artist page" do
    artist = Artist.create(name: "Morgan", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist)
    click_on "Edit"
    fill_in "artist_name", with: "Trey"
    click_on "Update Artist"

    expect(page).to have_content "Trey"
    expect(page).to_not have_content artist.name
  end
end
