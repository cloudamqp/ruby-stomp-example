require 'stomp'

opts = { :hosts => [{:login => 'guest', :passcode => 'guest', :host => 'localhost', port: 61613 }],
         :connect_headers => {"accept-version" => "1.1", "host" => "/" } }

client = Stomp::Client.new(opts)

client.publish('/queue/stomp', 'Hello world!', {:persistent => true})
client.subscribe("/queue/stomp") do |msg|
  puts Time.now, msg
end
sleep 3
