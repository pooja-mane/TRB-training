module User::Operation
  class Create < Trailblazer::Operation
    step Model(User, :new)
    # Alternative to macro Model is initialize_user
    # step :initialize_user

    # step Subprocess User::Operation::New
    step Contract::Build(constant: User::Contract::Form)
    step Contract::Validate(key: :user)
    step Contract::Persist()
    fail :set_error_message

    def initialize_user(ctx, **)
      ctx[:model] = User.new
    end

    def set_error_message(ctx, **)
      ctx[:errors] = ctx[:"contract.default"].errors.full_messages
    end
  end 
end