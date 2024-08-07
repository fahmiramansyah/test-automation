require_relative '../pages/base_page'    
class LoginPage < SitePrism::Page
        
    include BasePage

    path = get_config_data('WEB_BASE_URL')
    set_url(path)
    
    # erafone
    element :logoErafone, :xpath, "//*[@src='https://cdn.eraspace.com/pub/media/wysiwyg/logo/erafone-logo_1_2.png']"
    element :searchboxErafone, :xpath, '//*[@data-testid="qa-searchfield"]'
    element :btnSearchErafone, :xpath, '//*[@data-testid="qa-button-searchfield"]'
    element :btnMasukErafone, :xpath, "//*[@data-testid='qa-button-textmasuk']"
    element :btnDaftarErafone, :xpath, "//*[@data-testid='qa-button-textdaftar']"
    element :iconCartErafone, :xpath, "//*[@data-testid='qa-icon-cart']"
    element :sliderBannerErafone, :id, "mcis-banner-0"
    element :ddlKategoriErafone, :xpath, "//*[@data-testid='qa-button-textkategori']"
    element :ascFromCheapest, :xpath, "//*[@value='harga_terendah']"
    element :sortDdlPLP, :xpath, "//*[@data-testid='qa-sorting']"

    # tokopedia
    element :logoTokopedia, :xpath, "//*[@src='https://images.tokopedia.net/assets-tokopedia-lite/v2/zeus/production/e5b8438b.svg']"
    element :searchboxTokopedia, :xpath, '//*[@placeholder="Cari di Tokopedia"]'
    element :iconMasukAtauDaftarIBox, :xpath, "//*[@src='/icons/icon-user.png']"
    element :iconCartIBox, :xpath, "//*[@src='/icons/icon-cart.svg']"
    element :bannerTokopedia, :xpath, "//*[@data-testid='imgHomeSliderBanner#1']"
    element :ascFromCheapestTokped, :xpath, "//button[@data-item-text='Harga Terendah']"
    element :sortDdlPLPTokped, :xpath, "//*[@class='css-tdlia4']"

    
    def validateHomePageErafone
        logoErafone.should be_visible
        searchboxErafone.should be_visible
        btnMasukErafone.should be_visible
        btnDaftarErafone.should be_visible
        iconCartErafone.should be_visible
        sliderBannerErafone.should be_visible
        ddlKategoriErafone.should be_visible
    end

    def accessURLTokped
        tokpedPath = get_config_data('WEB_TOKOPEDIA_URL')
        visit (tokpedPath)
    end

    def validateHomePageTokped
        logoTokopedia.should be_visible
        searchboxTokopedia.should be_visible
        bannerTokopedia.should be_visible
    end

    def inputOnSearch(erafone)
        if page.has_xpath?("(//*[@aria-label='Close Popup'])[1]")
            page.find(:xpath, "(//*[@aria-label='Close Popup'])[1]").click
        end
        searchboxErafone.set(erafone)
    end

    def inputOnSearchTokped(tokped)
        searchboxTokopedia.set(tokped)
    end

    def searchResultErafone(erafone)
        lblSearchResult = page.find(:xpath, "//*[text()='#{erafone}']")
        lblSearchResult.should be_visible
        btnSearchErafone.click
    end

    def searchResultTokped(tokped)
        lblSearchResult = page.find(:xpath, "//strong[text()='#{tokped}']")
        lblSearchResult.should be_visible
    end

    def sortAscErafone
        sortDdlPLP.should be_visible
        sortDdlPLP.click
        ascFromCheapest.click
        $product1Erafone = page.find(:xpath, "(//*[@data-testid='qa-plp-name'])[1]").text
        $productprice1Erafone = page.find(:xpath, "(//*[@data-testid='qa-plp-price'])[1]").text
        page.find(:xpath, "(//*[@data-testid='qa-plp-name'])[1]").click
        wait_in_sec 1
        $productURL1Erafone = URI.parse(current_url)
        page.go_back
        $product2Erafone = page.find(:xpath, "(//*[@data-testid='qa-plp-name'])[2]").text
        $productprice2Erafone = page.find(:xpath, "(//*[@data-testid='qa-plp-price'])[2]").text
        page.find(:xpath, "(//*[@data-testid='qa-plp-name'])[2]").click
        wait_in_sec 1
        $productURL2Erafone = URI.parse(current_url)
        page.go_back
        $product3Erafone = page.find(:xpath, "(//*[@data-testid='qa-plp-name'])[3]").text
        $productprice3Erafone = page.find(:xpath, "(//*[@data-testid='qa-plp-price'])[3]").text
        page.find(:xpath, "(//*[@data-testid='qa-plp-name'])[3]").click
        wait_in_sec 1
        $productURL3Erafone = URI.parse(current_url)
        page.go_back
        $product4Erafone = page.find(:xpath, "(//*[@data-testid='qa-plp-name'])[4]").text
        $productprice4Erafone = page.find(:xpath, "(//*[@data-testid='qa-plp-price'])[4]").text
        page.find(:xpath, "(//*[@data-testid='qa-plp-name'])[4]").click
        wait_in_sec 1
        $productURL4Erafone = URI.parse(current_url)
        page.go_back
    end

    def sortAscTokopedia
        page.find(:xpath, '//*[@data-testid="btnSRPProductTab"]').click
        sortDdlPLPTokped.should be_visible
        sortDdlPLPTokped.click
        ascFromCheapestTokped.click
        wait_in_sec 1
        $product1Tokped = page.find(:xpath, "(//*[@class='OWkG6oHwAppMn1hIBsC3pQ=='])[1]").text
        $productprice1Tokped = page.find(:xpath, "(//*[@class='_8cR53N0JqdRc+mQCckhS0g== '])[1]").text
        page.find(:xpath, "(//*[@class='OWkG6oHwAppMn1hIBsC3pQ=='])[1]").click
        wait_in_sec 1
        $productURL1Tokped = URI.parse(current_url)
        page.go_back
        $product2Tokped = page.find(:xpath, "(//*[@class='OWkG6oHwAppMn1hIBsC3pQ=='])[2]").text
        $productprice2Tokped = page.find(:xpath, "(//*[@class='_8cR53N0JqdRc+mQCckhS0g== '])[2]").text
        page.find(:xpath, "(//*[@class='OWkG6oHwAppMn1hIBsC3pQ=='])[2]").click
        wait_in_sec 1
        $productURL2Tokped = URI.parse(current_url)
        page.go_back
        $product3Tokped = page.find(:xpath, "(//*[@class='OWkG6oHwAppMn1hIBsC3pQ=='])[3]").text
        $productprice3Tokped = page.find(:xpath, "(//*[@class='_8cR53N0JqdRc+mQCckhS0g== '])[3]").text
        page.find(:xpath, "(//*[@class='OWkG6oHwAppMn1hIBsC3pQ=='])[3]").click
        wait_in_sec 1
        $productURL3Tokped = URI.parse(current_url)
        page.go_back
        $product4Tokped = page.find(:xpath, "(//*[@class='OWkG6oHwAppMn1hIBsC3pQ=='])[4]").text
        $productprice4Tokped = page.find(:xpath, "(//*[@class='_8cR53N0JqdRc+mQCckhS0g== '])[4]").text
        page.find(:xpath, "(//*[@class='OWkG6oHwAppMn1hIBsC3pQ=='])[4]").click
        wait_in_sec 1
        $productURL4Tokped = URI.parse(current_url)
        page.go_back
    end

    def openNewTab
        new_window = open_new_window
        switch_to_window new_window
    end
        
end 