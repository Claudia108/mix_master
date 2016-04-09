require 'rails_helper'

RSpec.feature "user edits an artist" do
  scenario "they see the page for the individual artist" do
    artist             = Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    new_artist_name = "Michael Jackson"

    visit artist_path(artist.id)
    click_on "Edit Artist"
    fill_in "artist_name", with: new_artist_name
    fill_in "artist_image_path", with: artist.image_path
    click_on "Update Artist"

    expect(page).to have_content new_artist_name
    expect(page).to_not have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
