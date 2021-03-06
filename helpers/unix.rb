def members_of(group)
  members = []
  members.push(group) if `cat /etc/passwd | grep ^#{group}:`.length > 0
  csv = `cat /etc/group | grep ^#{group}:`[/^#{group}:.*?:.*?:(.*?)\n/, 1]
  csv.nil? ? members : members.concat(csv.split(','))
end

def home_of(user)
  if user == "root" && File.exist?("/root") && File.ftype("/root") == "directory"
    "/root"
  else
    "/home/#{user}"
  end
end
