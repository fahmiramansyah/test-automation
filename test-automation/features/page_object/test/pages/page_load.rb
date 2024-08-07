class Page 

    def initialize(tags)
        @tags = tags
    end

    def load(desktop=nil, mweb=nil)
        if @tags.include? '@mweb'
            return mweb
        elsif @tags.include? '@desktop'
            return desktop
        end       
    end    

    def login_page
        load(LoginPage.new)
        # load(LoginPage.new, LoginPageMweb.new)
    end

end
