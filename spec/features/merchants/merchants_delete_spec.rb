require 'rails_helper'

describe "merchant delete page", type: :feature do
    it "can delete a merchant" do

    merchant = Merchant.create( name: "Chesters Collectables",
                                  address: "123 Fake St",
                                  city: "Awesomeville",
                                  state: "Montana",
                                  zip: 59001,
    )

    visit "/merchants/#{merchant.id}"
    click_link('DELETE')

    expect(page).to_not have_content("Chesters Collectables")

  end
end