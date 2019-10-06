require 'rails_helper'

describe "Item delete page" do
  describe "as a visitor" do
    it "can delete items" do

      chesters = Merchant.create!( name: 'Chesters Collectables',
                                        address: '123 Fake St',
                                        city: 'Awesomeville',
                                        state: 'Montana',
                                        zip: 59001,

      )

      item = chesters.items.create!( name: 'Solid Gold Playing Cards',
                          description: 'One set of 52 solid gold playing cards.',
                          price: 1200,
                          image: 'https://i.imgur.com/LlHMnHG.jpg',
                          status: 'Active',
                          inventory: 2,
      )

      visit "/items/#{item.id}"

      click_link'DELETE'

      expect(page).to have_current_path("/items")
      expect(page).to not_have_content('Solid Gold Playing Cards')
    end
  end
end