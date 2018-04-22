class Student < ActiveRecord::Base
    has_many :answers
    has_many :questions
    has_secure_password
    validates :username, presence: true
    validates :password, presence: true
    validates :first_name, presence: true

    def num_of_questions
        questions.count
    end

    def num_of_answers
        answers.count
    end
end

#need to add the number of questions asked, the number of answeres, and the list of questions and numbers