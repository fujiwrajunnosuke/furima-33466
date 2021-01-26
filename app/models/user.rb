class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true
         validates :email, presence: true, uniqueness: true, format: {with: /@/}
         validates :password, presence: true, length:{ minimum: 6}, confirmation: true,
                              format: { with:  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
         validates :family_name
         validates :first_name
        end
        
        with_options presence: true, format: {with: /\A[ァ-ン]+\z/, message: 'カナ文字を使用してください' } do
         validates :call_family_name
         validates :call_first_name
        end

         validates :birth_day, presence: true
end