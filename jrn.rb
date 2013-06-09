#!/Users/pants/.rvm/rubies/ruby-1.9.3-p0/bin/ruby

require 'date'
require 'pathname'
require 'fileutils'

d = Date.today.day.to_s
if Date.today.day < 10
  d = "0" + d
end

m = Date.today.month.to_s
if Date.today.month < 10
  m = "0" + m
end

y = Date.today.year.to_s

# load storage location
config_file_lines = File.open(File.expand_path("~/.jrn/config.jrn"), "rb").read
config_file_lines.each_line do |s|
  if s.split('=')[0] == "storage_location" 
		$storage_location = s.split('=')[1].strip
	end
end
if $storage_location == nil
  print "storage_location not set in config file\n"
  exit
end
$template_location = $storage_location + "/template.jrn"

# if not exists $storage_location/y/m/
  # create folder
year_month_dir = $storage_location + "/" + y + "/" + m

if !Pathname.new(year_month_dir).exist?
  # print "y/m/ folder NOT exists\n"
  FileUtils.mkpath year_month_dir
  # print "created " + year_month_dir + "\n"
else
  # print "y/m/ folder exists\n"
end

# if not exists $storage_location/y/m/d.jrn
  # create new document, copied from template if exists
day_journal_file = year_month_dir + "/" + d + ".jrn"

if !Pathname.new(day_journal_file).exist?
  # print day_journal_file + " NOT exist\n"
  if Pathname.new($template_location).exist?
		# print $template_location + " exists. Copying template into " + day_journal_file + "\n"
		FileUtils.cp $template_location, day_journal_file
    # print "cp " + $template_location + " " + day_journal_file + "\n"
  end
end

#TODO put the date and time at the beginning of the document
h = DateTime.now.hour.to_s


exec("vim " + $storage_location + "/" + y + "/" + m + "/" + d + ".jrn")
# print "vim " + $storage_location + "/" + y + "/" + m + "/" + d + ".jrn\n"
