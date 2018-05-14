class Student < ActiveRecord::Base
    has_many :comments
    has_many :questions
    
    validates :username, presence: true
    validates :username, uniqueness: true

    def num_of_questions
        questions.count
    end

    def num_of_answers
        comments.count
    end
end

#need to add the number of questions asked, the number of answeres, and the list of questions and numbers