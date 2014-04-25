namespace :import do
  task :attendees, [:path] => :environment do |t, args|
    args.with_defaults(path: Rails.root.join('data/attendees.csv'))
    AttendeeImporter.import_file(args[:path])
  end
end
