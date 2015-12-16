class TokenGuardian

  attr_reader :encryptor, :params

  def self.build(controller:)
    # Borrow MessageEncryptor, thank you CookieJar.
    encryptor = controller.request.cookie_jar.encrypted.instance_variable_get :@encryptor
    TokenGuardian.new(encryptor: encryptor, params: controller.params)
  end

  def initialize(encryptor:, params:)
    @encryptor = encryptor
    @params = params
  end

  def issue_token
    user = authenticate_user
    access_token = user.issue_access_token
    encryptor.encrypt_and_sign(access_token.unencrypted)
  end
end