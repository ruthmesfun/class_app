class Question < ActiveRecord::Base
    has_many :answers
    belongs_to :student

    validates :title, presence: true
    validates :content, presence: true
    validates :link, presence: true
    validates :lab, presence: true

    def student_username
        self.student.username
    end
end