# Account

## Survey::Field
label
name
variant (string | dropdown)
choices
parent (Survey)

## Survey
body (liquid)
has_many :responses
has_many :fields

## Survey::Response
properties (store)
belongs_to respondent (Contact)
belongs_to creator (User)
belongs_to parent (Survey)

***

## Survey
surveyee (Contact)
surveyor (User)
template (string, erb)

contacts/6498/survey

