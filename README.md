# Collective

## Purpose

This app would be designed to allow students to post ideas about topics being explored in class in one location. This would allow students in a class to post their helpful ideas for other students to see and reference so everyone can start discussions and document their learning together.

Posts would be persisted for a topic and stored for future viewing. Every post can receive upvotes and can be commented on. A certain number of votes for a topic would contribute to achievements for a user.

Teachers setup classes and students can add themselves. Teachers can also add ideas and topic posts, just like students.

### Users
- [X] Describes a student and/or a teacher
- [ ] Attributes
  - [X] User should have a first_name.
  - [X] User should have a last_name.
  - [X] User should have a email.
  - [X] User should have a password.
    - [ ] Password should be secure
  - [X] User should have an is_teacher status.
- [X] If a user is not a teacher (admin), they are automatically a student, but never not a student.


### Students
- [ ] Students sign up for a profile.
- [ ] Student can join topics.
- [ ] Students can join classes by invitation from their teacher (extension work).
- [ ] Students are able to post any topic.
- [ ] Students can create topics.
- [ ] Students can gain achievement badges based on upvotes.
- [ ] Students can upvote other students' submissions.

### Teachers
- [ ] Teachers sign up for a profile.
- [ ] Teachers can set up classes (extension work).
- [ ] Teachers can create topics for discussion.
- [ ] Teachers can join topics.
- [ ] Teachers can post in any topics they've created.
- [ ] Teachers can remove students from a topic (extension work).
- [ ] Teachers can add a level of verification/certification to a post, highlighting it.

### Posts
- [ ] Posts belong to a topic in a class and also to the user that posted them.
- [ ] Posts can be commented on (thread stlye)
- [ ] Posts can be created by students and teachers.
- [ ] Posts can be udpated by the student/teacher that created them.
- [ ] Posts can be viewed by any user; they don't have to be in a classroom.
- [ ] Posts can be removed by the user that created them and by any teacher of that classroom.
- [ ] Posts are sorted by number of upvotes and possibly other achievements.

### Topics
- [ ] Topics can be created by Teachers, not Students.
- [ ] Topics can be updated by Teachers, not Students.
- [ ] Topics can be deleted by Teachers, not Students.
- [ ] All topics can be viewed per Teacher, not per Student.
- [ ] All topics can be viewed overall.

### Comments
- [ ] Comments can be added to any post.
- [ ] Comments should be short text to encourage new ideas to be new posts.
- [ ] Comments can be created by any student or teacher of a classroom on any post.
- [ ] Comments can also be viewed by anyone, even outside of the classroom.
- [ ] Comments can be updated by the student/teacher that added them.
- [ ] Comments can be deleted by the student that created it or by a teacher.

## User Stories

#### User Pages (Student & Teachers)
- [ ] As a visitor, when I visit `/` and click `Sign Up`, I am able to create a profile (student by default).
- [ ] As a user when I go to  `/users/:id`, I can view, update, and delete my profile. (extension would be to alias that url)
- [ ] As a user or visitor when I go to `/users`, I can view all users.
- [ ] As a user or visitor when I go to `/users` and click on the name of a user I am taken to `/users/:id` and I can see all of their posts. 
- [ ] As a user or visitor, when I go  to `/topics` I can view all topics.
- [ ] As a user or visitor, when I go  to `/topics` and I click on the title of a topic, I am taken to that discussion with the option to either `Join Discussion` or `Sign Up`.

#### Topic Pages (Includes functionality for Posts and Comments)
- [ ] As a logged in user, when I go to the `/topics` page, then I can view, search, and sort through all topics.
- [ ] As a user, when I go to `/teachers/:id/topics`, then I can delete or navigate to editing any topics I've created.
- [ ] As a teacher, when I go to `/topics/new`, then I can create a new topic.
- [ ] As a user, when I go to `/topics` and I click `Join Discussion`, then I can join a discussion and start posting.
- [ ] As a user, when I visit `/topics` and click on the title link for a topic, I am taken to that discussion where I will also have the option to join the discussion or not.
- [ ] As a user, when I go to `topic/:id` and I have joined this discussion, I can see all posts and comments in that topic, create new posts or comments.
- [ ] As a user, when I go to `topic/:id` and I have joined this discussion, I can see all posts and comments in that topic, edit my posts or comments.
- [ ] As a user, when I go to `topic/:id` and I have joined this discussion, I can see all posts and comments in that topic, delete my posts or comments.



### Schema Design

![schema draft](schema_draft.png)
