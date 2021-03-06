# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Applicant::JobRequest.destroy_all
Recruiter::Account.destroy_all
Admin::Account.destroy_all

Recruiter::Account.create! full_name: 'ابن خلدون', username: 'recruiter', password: 'recruiter'
Admin::Account.create! full_name: 'ابن سينا', username: 'admin', password: 'admin'

job_requests = [
  {full_name: 'الخليل أحمد الفراهيدي', phone: '0512345678', address: 'عمان',
    specialization: 'علوم شرعية', degree: 'أستاذ'},
  {full_name: 'ابن خلدون', phone: '0521345678', address: 'تونس',
    specialization: 'فيزياء', degree: 'أستاذ'},
  {full_name: 'ابن سينا', phone: '0521345678', address: 'بخارى',
    specialization: 'كيمياء', degree: 'أستاذ'},
]

job_requests.each do |job_request|
  Applicant::JobRequest.create! job_request
end
