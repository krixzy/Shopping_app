class IndexController < SessionController
    before_action :check_login
    def index
        puts "test"
    end
        
end
