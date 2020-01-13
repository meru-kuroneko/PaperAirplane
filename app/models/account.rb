class Account
  include ActiveModel::Model
  attr_accessor :type, :token

  # # before_saveを使うための記述
  # define_model_callbacks :save
  # # callbackで実行するmethodを指定
  # before_save :form_validation

  validates :type, presence: true, strict: true

  # private
  # def form_validation
  #   self.valid?
  # end

end