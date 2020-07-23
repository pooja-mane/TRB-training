module User::Operation
  class Index < Trailblazer::Operation

    step :valid_user?
    step :load_users
    fail :set_unathorized_error

    def valid_user?(ctx, **)
      true      
    end

    def load_users(ctx, **)
      ctx[:model] = User.all
    end

    def set_unathorized_error(ctx, **)
      ctx[:errors] = 'unathorized error'
    end
    # step Model(User, :find_by)

    # step :create_user
    # step :address_presents?, Output(:failure) => Id(:send_mail)
    # step :create_address
    # step :send_mail

    # def create_user(ctx, user_params:, **)
    #   ctx[:user] = User.create(user_params)
    # end

    # def address_presents?(ctx, **)
    #   ctx[:address_params].present?
    # end

    # def create_address(ctx, address_params: ,**)
    #   # ctx[:user].create_address(address_params)
    #   p 'in create address'
    # end

    # def send_mail(ctx, **)
    #   p 'in send mail'
    # end

    # step :is_valid_user?
    # step :load_data
    # fail :set_errors
    # pass :build_user

    # def is_valid_user?(ctx, **)
    #   true
    # end

    # def load_data(ctx, **)
    #   ctx[:users] = User.all
    # end

    # def set_errors(ctx, **)
    #   ctx[:errors] = 'Invalid user'
    # end

    # def build_user(ctx, **)
    #   ctx[:build_result] = 'Build successfully.'
    # end
  end
end