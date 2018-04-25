class Comment < ActiveRecord::Base
    belongs_to :question
    belongs_to :student
    validates :content, presence: true

    def question_title
        self.question.title
    end

    def question_content
        self.question.content
    end

    def student_username
        self.student.username
    end
end
