class SessionsController < ApplicationController

    def new
    end

    def create
        # check if the user exists
        @user = User.find_by({"email" => params["email"]})
        # if they do, check if they know heir pass, if yes send them in
        if @user
            if (BCrypt::Password.new(@user["password"])== params["password"]) 
                
                cookies["monster"] = "me like cookies"
                session["user id"] = @user["id"]
                redirect_to "/companies"
            else
                redirect_to "/sessions/new"
            end

        else
            redirect_to "/sessions/new"
            end
    end
end