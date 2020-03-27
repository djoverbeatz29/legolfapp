class Golfer < ApplicationRecord

    has_secure_password

    # def password
    #     BCrypt::Password.new(self.password_digest)
    # end

    # def password=(new_password)
    #     self.password_digest = BCrypt::Password.create(new_password)
    # end

    # def authentication(pass_try)
    #     if self.password == pass_try
    #         return self
    #     end
    # end

end 

<h1>Log In</h1>

<%= flash[:error] %>

<%= form_with url: "/sessions" do %>
    Email: <%= text_field_tag :email %>
    Password: <%= password_field_tag :password %>
    <%= submit_tag "Log In" %>
<% end %>

def create
user = User.find_by(email: params[:emal])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.user_id
    redirect_to user
else
    flash[:error] = "Invalid credentials. Try again!"
    redirect_to login_path
end

def destroy
    session[:user_id] = nil
    redirect_to users_path
end
<%= link_to "Log Out", logout_path, method :delete %>
<%= link_to "Log In", login_path %>