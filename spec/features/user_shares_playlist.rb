require 'spec_helper'

describe "a user can share a playlist with another user" do
   let(:user) do 
    User.create!({
      email: "j@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Jeff",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:friend) do 
    User.create!({
      email: "john@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "John",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:not_friend) do 
    User.create!({
      email: "jim@k.co",
      password: "jim",
      password_confirmation: "jeff",
      first_name: "Jeff",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end


  let(:kesha) do
    Artist.create!({
      name: "Ke$ha",
      photo_url: "http://placekitten.com/g/200/200"
    })
  end

  let(:tick_tock) do
    Song.create!({
      title: "Tick Tock",
      price: 1.99,
      artist: kesha
    })
  end

  let(:love_is_my_drug) do
    Song.create!({
      title: "Love is My Drug",
      price: 0.99,
      artist: kesha
    })
  end

  let(:purchase_tick_tock) { Purchase.create(user: user, song: tick_tock) }
  let(:playlist) {Playlist.create!(title: "Mellow Tunes", user: user)}

  before do
    PlaylistPurchase.create!(playlist: playlist, purchase:
      purchase_tick_tock)
  end

  it "share a playlist" do
    # Setup
    login(user)

    # Workflow for feature
    visit user_path(user)
    click link "View playlists"
    visit 
    fill_in "Name", with: ""
end