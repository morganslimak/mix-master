require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "they see the updated songs list" do
    playlist = create(:playlist_with_songs)
    song = create(:song, title: "random song")

    visit playlist_path(playlist)
    click_on "Edit playlist"
    check("song-#{song.id}")
    click_on "Update Playlist"

    expect(page).to have_link song.title, href: song_path(song)
  end
end
