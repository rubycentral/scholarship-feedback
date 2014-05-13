event
  name ("RubyConf 2014")
  description ("some markdown text about the event")
  start_date
  end_date

attendee = user object
  twitter/github handle ("ohrite")

scholarship
  for an attendee (who is the scholar) -> attendee_id
  and for an event -> event_id
  approved (false by default)

scholarship_guide
  for an attendee (who is the guide) -> attendee_id
  and for an event -> event_id
  and a scholarship (nullable) -> scholarship_id
  approved (false by default)

question
  for an event -> event_id
  text ("what is your favorite color?")

answer
  for an attendee -> attendee_id
  and for a question -> question_id
  text ("blue no green aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah")

1. user signs in with twitter/github
2. user fills out their profile
3. user clicks on their event
4. user clicks the "i want to be a scholar"/"i want to be a guide" button
5. user answers a bunch of questions on a questionnaire page
6. organizer makes some notes and approves the scholar (or guide)
7. user is notified of their scholarship approval (or mentorship approval)
8. organizer matches scholars with guides
9. scholar-guide groups are notified
... conference ...
10. user is prompted for feedback about their experience
11. user fills out feedback questionnaire
12. organizer reads feedback from all users
