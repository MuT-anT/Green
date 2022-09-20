class Chef<ApplicationRecord
    before_save {self.email=email.downcase}
    validates :name, presence: true, length: { maximum: 30 }
    VALID_EMAIL_REGEX= ~ /^(([A-Za-z0-9]*\.+*_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\+)|([A-Za-z0-9]+\+))*[A-Z‌​a-z0-9]+@{1}((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,4}$/i

    validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
    has_many :recipes, dependent: :destroy
    has_secure_password
    validates :password, presence: true, length: {minimum: 5}
end