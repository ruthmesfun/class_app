require 'dotenv/load'
require './config/environment'


use Rack::MethodOverride

use CommentController
use QuestionController
use StudentController

run ApplicationController