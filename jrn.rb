#!/Users/pants/.rvm/rubies/ruby-1.9.3-p0/bin/ruby

require 'date'

d = Date.today.day.to_s
if Date.today.day < 10
  d = "0" + d
end

m = Date.today.month.to_s
if Date.today.month < 10
  m = "0" + m
end

y = Date.today.year.to_s

$storage_location = "/Users/pants/Dropbox/journal"

# if not exists $storage_location/y/
	# create folder

# if not exists $storage_location/y/m/
  # create folder

# if not exists $storage_location/y/m/d.jrn
  # create new document, copied from template of exists

exec("vim " + $storage_location + "/" + y + "/" + m + "/" + d + ".jrn")
# print "vim " + $storage_location + "/" + y + "/" + m + "/" + d + ".jrn\n"
