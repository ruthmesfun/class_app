# TASK LIST FOR SINATRA PORTFOLIO PROJECT
[X] Build an MVC Sinatra Application.
[X] Use ActiveRecord with Sinatra.
[X] Use Multiple Models.
[X] Use at least one has_many relationship on a User model and one belongs_to relationship on another model
[X] Must have user accounts. The user that created a given piece of content should be the only person who can modify that content
[ ] Must have the abilty to create, read, update and destroy any instance of the resource that belongs to a user.
[ ] Ensure that any instance of the resource that belongs to a user can be edited or deleted only by that user.
[X] You should also have validations for user input to ensure that bad data isn't added to the database. The fields in your signup form should be required and the user attribute that is used to login a user should be a unique value in the DB before creating the user.

## TASK LIST - Student
1. Create a Sign-up page
    [X] Secure password
    [X] Validates information
    [X] Create working form 
    [X] Check if they are a new user or current user
    - There is an error when creating sign up if not done correctly << add rack flash last! 
2. Create a Login page
    [X] Check if they are a current user
    [X] Create working form
    [X] Check if they have the correct login info
3. Create a profile page
    [X] Name of user
    [X] github link
    [X] profile pic
    [X] num of q
    [X] num of a
    [X] list of q
    - list of a
[X] Create a logout page
[X] Create an edit page

## TASK LIST - Question
1. Create a question form 
    [X] Make sure the student is logged in
    [X] Validates all information is present
    - Owner can edit each question
[X] Add tag to question migrations
2. Created an index page
    [X] Add all questions on the index page 
    [X] Link them to the show page
4. Each question as they own show page 
    - show page has title, content, creator, and created date

## TASK LIST - Answers

## TASK LIST - Bootstrap