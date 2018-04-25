require './config/environment'
use Rack::MethodOverride
use AnswerController
use QuestionController
use StudentController
run ApplicationController