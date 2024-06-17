# README

ATS with Event Sourcing

`rails db:seed` to seed a database

`rspec spec` to run unit tests

`curl http://127.0.0.2:3000/api/v1/applications` to list applications for all activated jobs, response example:
```
[
  {
    "job_title": "Sequi est consequatur",
    "candidate_name": "Tyrell Olson",
    "status": "Interview",
    "notes_count": 3,
    "interview_date": "2024-06-10T15:53:03.992+00:00"
  }
]
```

`curl http://127.0.0.2:3000/api/v1/jobs` to list all jobs (including deactivated ones), response example:
```
[
  {
    {
      "title": "In nobis nemo",
      "status": "Activated",
      "hired": 1,
      "rejected": 0,
      "ongoing": 4
    }
  }
]
```
