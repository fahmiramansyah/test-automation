Given("user access website erafone") do
    @page.login_page.load
    @page.login_page.validateHomePageErafone
end

When("user access website tokopedia") do
    @page.login_page.accessURLTokped
    @page.login_page.validateHomePageTokped
end

Then("user input {string} on searchbox erafone") do |erafone|
    @page.login_page.inputOnSearch(erafone)
end

When("user input {string} on searchbox tokopedia") do |tokped|
    @page.login_page.inputOnSearchTokped(tokped)
end

Then("user click button search on erafone") do
    @page.login_page.btnSearchErafone.click
end

When("user click button search on tokopedia") do
    @page.login_page.searchboxTokopedia.send_keys(:return)
end

Then("system show search result page for {string} on erafone") do |erafone|
    @page.login_page.searchResultErafone(erafone)
end

When("system show search result page for {string} on tokopedia") do |tokopedia|
    @page.login_page.searchResultTokped(tokopedia)
end

Then("user sort by ascending on erafone from cheapest") do
    @page.login_page.sortAscErafone
end

When("user sort by ascending on tokopedia from cheapest") do
    @page.login_page.sortAscTokopedia
end

Then("user open new tab") do
    @page.login_page.openNewTab
end

When("user combine & compare product from both website") do
    puts "Erafone"
    puts $product1Erafone
    puts $productprice1Erafone
    puts $productURL1Erafone
    puts $product2Erafone
    puts $productprice2Erafone
    puts $productURL2Erafone
    puts $product3Erafone
    puts $productprice3Erafone
    puts $productURL3Erafone
    puts $product4Erafone
    puts $productprice4Erafone
    puts $productURL4Erafone
    puts "-"
    puts "Tokopedia"
    puts $product1Tokped
    puts $productprice1Tokped
    puts $productURL1Tokped
    puts $product2Tokped
    puts $productprice2Tokped
    puts $productURL2Tokped
    puts $product3Tokped
    puts $productprice3Tokped
    puts $productURL3Tokped
    puts $product4Tokped
    puts $productprice4Tokped
    puts $productURL4Tokped

end







Then("user input password {string}") do |invalidPass|
    @page.login_page.inputPass.set get_config_data(invalidPass)
end

When("user click login") do
    @page.login_page.btnLogin.click
end

Then("system show error message cant login") do
    @page.login_page.errorMsgCantLogin.should be_visible
end

When("user success login") do
    @page.login_page.validateSuccessLogin
end

Then("add to cart product") do
    @page.login_page.productName1.should be_visible
    @page.login_page.productPrice1.should be_visible
    if has_css?(".add-to-cart-sauce-labs-backpack")
        @page.login_page.btnAddtoCart1.click
    end    
    @page.login_page.btnAddtoCart2.click
end

When("system show notification cart is 1") do
    @page.login_page.notif1onCart.should be_visible
end

When("button product card is change to remove") do
    @page.login_page.btnRemove.should be_visible
end

Then("user click icon cart") do
    @page.login_page.icnCart.click
end

When("system show product already on cart") do
    @page.login_page.productName1.should be_visible
    @page.login_page.productPrice1.should be_visible
    @page.login_page.btnCheckout.click
end




